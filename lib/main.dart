import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:proyect_topicos_mobile/src/providers/authservice.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/homepage.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
    ]);
    Permission.microphone.request().then((value) => print(value.isGranted));

    return ChangeNotifierProvider(
      create: (_) => ActionProvider(HomePage()),
      child: MaterialApp(
        title: "ProyecTópicos Mobile",
        debugShowCheckedModeBanner: false,
        home: AuthService.instance.handleAuth(),
        darkTheme: ThemeData.dark(),
      ),
    );
  }
}
