import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:proyect_topicos_mobile/src/providers/authservice.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/homepage.dart';
import 'package:proyect_topicos_mobile/src/providers/action.provider.dart';
import 'package:proyect_topicos_mobile/src/widgets/views/userpage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return ChangeNotifierProvider(
      create: (_) => ActionProvider(UserPage()),
      child: MaterialApp(
        title: "ProyecTópicos Mobile",
        debugShowCheckedModeBanner: false,
        home: AuthService.instance.handleAuth(),
        darkTheme: ThemeData.dark(),
      ),
    );
  }
}
