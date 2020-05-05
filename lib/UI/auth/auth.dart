import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interview_app/UI/helpers/colors.dart';
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
  void initState() {
    passwordVisible = false;
    logInButtonClicked = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final hp = Screen(context).hp;
    final wp =Screen(context).wp;
    return Scaffold(
       body: SingleChildScrollView(
                child: Container(
           height: hp(100),
           width: wp(100),
           
           decoration: BoxDecoration(
             /* color: Colors.red, */
            image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover)),
           child: Container(
             margin: EdgeInsets.symmetric(horizontal: wp(15)),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 loginText(20,35, FontWeight.w700,"Welcome", "Back"),
                 loginText(1, 14, FontWeight.w700, 'Hey! good to see you again.',''),
                 loginText(3,35, FontWeight.w700,"Sign in",''),
                 email(context),
                 password(context),
                 submitBtn(context),
                 createAccount(),
               ],
             ),
           ),
         ),
       ),
    );
  }
  Widget loginText(double marginTop, double fontSize, FontWeight fontWeight, String loginText1,String loginText2){
    final hp = Screen(context).hp;
    return Container(
      margin: EdgeInsets.only(top:hp(marginTop)),
      child: Text('$loginText1\n$loginText2 ',
      style: GoogleFonts.cabin(
       fontSize: fontSize, 
       fontWeight: fontWeight
      ),),
    );
  }
  Widget email( BuildContext context) {
    final hp = Screen(context).hp;
    final wp =Screen(context).wp;
    return StreamBuilder<String>(
        stream: null,
        builder: (builder, snapshot) {
          return Container(
            margin: EdgeInsets.only(top: hp(0.7)),
            width:hp(75),
            child: TextField(
              keyboardType: TextInputType.text,
              onChanged: null,
              controller: _userName,
              decoration: InputDecoration(
                  focusColor: interviewPayMainPurple,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: interviewPayMainPurple)),
                  contentPadding: EdgeInsets.zero,
                  labelText: 'Email',
                  hintText: "patrick@techarems.com",
                  hintStyle: GoogleFonts.cabin(
                    color: interviewGrey.withOpacity(0.3),
                  ),
                  labelStyle: GoogleFonts.cabin(
                    color: interviewBodyBalck,
                    fontWeight: FontWeight.normal,
                    fontSize: labelText,
                  ),
                  errorText: snapshot.error),
            ),
          );
        });
  }
  Widget password(BuildContext context) {
    final hp = Screen(context).hp;
    final wp = Screen(context).wp;
    return StreamBuilder<String>(
        stream: null,
        builder: (context, snapshot) {
          return Container(
            margin: EdgeInsets.only(top: 15),
            width: wp(75),
            child: TextField(
              keyboardType: TextInputType.text,
              controller: _password,
              onChanged: null,
              obscureText: passwordVisible, //This will obscure text dynamically
              decoration: InputDecoration(
                  focusColor: interviewPayMainPurple,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: interviewPayMainPurple)),
                  contentPadding: EdgeInsets.zero,
                  labelText: 'Password',
                  hintText: '*****',
                  labelStyle: GoogleFonts.cabin(
                    color: interviewBodyBalck,
                    fontWeight: FontWeight.normal,
                    fontSize: labelText,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  errorText: snapshot.error),
            ),
          );
        });
  }

  Widget submitBtn(BuildContext context){
    final wp = Screen(context).wp;
    final hp = Screen(context).hp;
    return Container(
      margin: EdgeInsets.only(top:hp(5)),
      width: wp(75),
      decoration: BoxDecoration(
        color: interviewPayMainPurple,
        borderRadius: BorderRadius.circular(10)
      ),
      child: FlatButton(onPressed: (){
        print('login done');
      }, child: Text('Login', style: GoogleFonts.cabin(
        fontSize: textFont,
        color:interviewPayWhite,
      ),), color: interviewPayMainPurple,));
  }
  Widget createAccount(){
    return GestureDetector(
      onTap: null,
      child: Container(
        margin: EdgeInsets.only(top:10),
        alignment: Alignment.center,
        child:Text('Don\'t have and account ?')
      ),
    );
  }
}