import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:proyect_topicos_mobile/src/providers/speechProvider.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';

class DialogProvider {
  ActionProvider _provider;

  static DialogProvider _instance = DialogProvider();
  static DialogProvider get instance => _instance;

  final _scopes = [
    DialogflowApi.DialogflowScope,
    DialogflowApi.CloudPlatformScope,
  ];

  StreamController<GoogleCloudDialogflowV2DetectIntentResponse>
      _responseStreamController;

  Stream<GoogleCloudDialogflowV2DetectIntentResponse> get responseStream =>
      _responseStreamController.stream;

  DialogflowApi _api;
  String _projectID, _sessionID;
  AutoRefreshingAuthClient _client;

  init(ActionProvider p, String sessionID) {
    _sessionID = sessionID;
    this._provider = p;
    _responseStreamController = StreamController<
        GoogleCloudDialogflowV2DetectIntentResponse>.broadcast();
    rootBundle.loadString('assets/credentials.json').then((string) {
      var json = jsonDecode(string);
      _projectID = json["project_id"];

      clientViaServiceAccount(ServiceAccountCredentials.fromJson(json), _scopes)
          .then((client) => _api = DialogflowApi(_client = client))
          .catchError((e) => print(e.toString()));
    });
  }

  detectIntent(String query) {
    var req = GoogleCloudDialogflowV2DetectIntentRequest.fromJson({
      "queryInput": {
        "text": {
          "text": query,
          "languageCode": "ES",
        },
      },
      "outputAudioConfig": {
        "audioEncoding": "OUTPUT_AUDIO_ENCODING_OGG_OPUS",
      },
    });
    _api.projects.agent.sessions
        .detectIntent(req, "projects/$_projectID/agent/sessions/$_sessionID")
        .then((res) => _processResponse(res))
        .catchError((e) => print(e.toString()));
  }

  _processResponse(GoogleCloudDialogflowV2DetectIntentResponse res) {
    Reader.instance.textToSpeech(res.outputAudio);

    _provider.executeAction(res.queryResult);

    _responseStreamController.sink.add(res);
  }

  dispose() {
    _client?.close();
    _responseStreamController?.close();
  }
}
