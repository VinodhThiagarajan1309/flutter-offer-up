import 'package:flutter/material.dart';
import 'package:flutter_course/pages/products.dart';

class AuthPage extends StatefulWidget {
  @override
  State createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {

  final Map<String,dynamic> loginData = {
    "email": null
  };
  bool _termsAndCondition = false;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backgrounds.jpg"),
                  fit: BoxFit.fill)),
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (String value) {
                    if (value.isEmpty ||
                        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(value)) {
                      return 'Email is required and must be a valid one.';
                    }
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "E-Mail Id",
                      filled: true,
                      fillColor: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String value) {

                    loginData["email"] = value;

                  },
                ),
                TextFormField(
                  validator: (String value) {
                    if(value.length < 5) {
                      return 'Password must be 5+ characters.';
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Password",
                  ),
                  obscureText: true,
                  //TextInputType.numberWithOptions(signed: false, decimal: true),
                  onSaved: (String value) {

                      //_password = value;

                  },
                ),
                SwitchListTile(
                  title: Text("Terms and Conditions"),
                  value: _termsAndCondition,
                  onChanged: (bool value) {
                    setState(() {
                      _termsAndCondition = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    if (!_loginFormKey.currentState.validate()) {
                      return; // Do nothing
                    }
                    _loginFormKey.currentState.save();
                    Navigator.pushReplacementNamed(context, "/products");
                  },
                  child: Text("Login"),
                )
              ],
            ),
          )),
    );
  }
}
