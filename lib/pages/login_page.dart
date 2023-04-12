// ignore_for_file: no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_provider.dart';
import '../services/navigation_services.dart';
import '../widgets/custom_input_form.dart';
import '../widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageStates();
  }
}

class _LoginPageStates extends State<LoginPage> {
  late double _deviceHeight;
  late double _deviceWidth;

  late AuthenticationProvider _auth;
  late NavigationServices _navigation;

  final _loginFormKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthenticationProvider>(context);
    _navigation = GetIt.instance.get<NavigationServices>();
    return _buidUI();
  }

  Widget _buidUI() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.03, vertical: _deviceHeight * 0.02),
        height: _deviceHeight * 0.98,
        width: _deviceWidth * 0.97,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _deviceHeight * 0.19,
              ),
              _pageTitle(),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              _loinForm(),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              _loginButton(),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              _registerAccountLink()
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      height: _deviceHeight * 0.10,
      child: const Text(
        'Chatify',
        style: TextStyle(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _loinForm() {
    return Container(
      height: _deviceHeight * 0.26,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextFormField(
                regx:
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                hinttext: "Email",
                obscureText: false,
                onSaved: (_value) {
                  setState(() {
                    _email = _value;
                  });
                }),
            SizedBox(
              height: _deviceHeight * 0.04,
            ),
            CustomTextFormField(
                regx: r".{8,}",
                hinttext: "Password",
                obscureText: true,
                onSaved: (_value) {
                  setState(() {
                    _password = _value;
                  });
                }),
            SizedBox(
              height: _deviceHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RoundedButton(
        name: "Login",
        height: _deviceHeight * 0.065,
        width: _deviceWidth * 0.65,
        onPressed: () {
          if (_loginFormKey.currentState!.validate()) {
            _loginFormKey.currentState!.save();
            _auth.loginUsingEmailAndPassword(_email!, _password!);
          }
        });
  }

  Widget _registerAccountLink() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: const Text(
          'Dont\'t have a account ?',
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
