import 'dart:async';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class SpeechData {
  bool status;
  String result, error;
}

class SpeechRecognizer {
  static SpeechRecognizer _instance = SpeechRecognizer();
  static SpeechRecognizer get instance => _instance;

  LocaleName lang;
  final _data = SpeechData();
  final _stt = SpeechToText();
  final _speechStreamController = StreamController<SpeechData>.broadcast();

  SpeechData get data => _data;
  Stream<SpeechData> get dataStream => _speechStreamController.stream;
  Function(SpeechData) get dataSink => _speechStreamController.sink.add;

  init() {
    _stt.initialize(onError: _onError, onStatus: _onStatus).then((active) {
      if (active) _stt.systemLocale().then((locale) => lang = locale);
    });
  }

  speechToText() async {
    if (await _stt.initialize(onStatus: _onStatus, onError: _onError)) {
      _stt.listen(onResult: _onResult, localeId: lang?.localeId ?? "es_ES");
    }
    // some time later
    _stt.stop();
  }

  _onResult(SpeechRecognitionResult result) {
    _data.result = result.recognizedWords;
    dataSink(_data);
  }

  _onStatus(String status) {
    _data.status = status == "listening";
    dataSink(_data);
  }

  _onError(SpeechRecognitionError error) {
    _data.error = error.errorMsg;
    dataSink(_data);
  }

  dispose() {
    _speechStreamController?.close();
  }
}
