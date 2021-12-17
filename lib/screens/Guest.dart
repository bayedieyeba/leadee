import 'package:flutter/material.dart';
import 'package:leadeetuto/models/UserModel.dart';
import 'package:leadeetuto/screens/dashboard/home.dart';
import 'package:leadeetuto/screens/guest/auth.dart';
import 'package:leadeetuto/screens/guest/password.dart';
import 'package:leadeetuto/screens/guest/term.dart';
import 'package:leadeetuto/screens/services/UserService.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();
  List<Widget> _widget = [];
  int _indexSelected = 0;
  late String _email;

  @override
  void initState() {
    super.initState();
    _widget.addAll([
      AuthPage(
        onChangedStep: (index, value) => setState(() {
          _indexSelected = index;
          _email = value;
        }),
      ),
      TermPage(
        onChangedStep: (index) => setState(() => _indexSelected = index),
      ),
      PasswordPage(
        onChangedStep: (index, value) => setState(() {
          if (index != null) {
            _indexSelected = index;
          }
          if (value != null) {
            _userService
                .auth(UserModel(
              email: _email,
              password: value,
            ))
                .then((value) {
              if (value.uid != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
            });
          }
        }),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widget.elementAt(_indexSelected),
    );
  }
}
