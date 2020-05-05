import 'package:flutter/material.dart';
import 'package:responsive_screen/responsive_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible;
  bool logInButtonClicked;
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  ValueNotifier<bool> isValidated = ValueNotifier(false);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    final hp = Screen(context).hp;
    final wp =Screen(context).wp;
    return Scaffold(
       body: Container(

       ),
    );
  }
}