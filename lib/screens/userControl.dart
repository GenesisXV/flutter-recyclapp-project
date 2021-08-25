import 'package:flutter/material.dart';
import 'package:recyclapp_v1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignIn/mainlogo.dart';
import 'SignIn/signin.dart';
import 'SignIn/signup.dart';

class UserControl extends StatefulWidget {
  const UserControl({Key? key}) : super(key: key);

  @override
  _UserControlState createState() => _UserControlState();
}

class _UserControlState extends State<UserControl> {
  bool _isLogin = false;
  _checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = (prefs.getBool('isLogin') ?? false);

    setState(() {
      _isLogin = isLogin;
    });

    print('prefs $isLogin');
  }

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLogin ? _signInWidget() : MainPage();
  }

  Widget _signInWidget() {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[mainLogo(), SignIn(), SignUp()],
          ),
        ),
      ),
    );
  }
}
