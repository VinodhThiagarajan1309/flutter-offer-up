
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course/models/user.dart';
mixin UserScopeModel on Model {

  User _authenticatedUser;

  void login(String email, String password) {
    print('email is ' + email);

    _authenticatedUser = User(id: "sds", eMail: email, password: password);

  }

}