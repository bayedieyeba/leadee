import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final Function(int, String) onChangedStep;
  const AuthPage({required this.onChangedStep});
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  String _email = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.0,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Everyone has\n'.toUpperCase(),
                      style: TextStyle(color: Colors.black, fontSize: 30.0),
                      children: [
                        TextSpan(
                            text: 'knowledge\n'.toUpperCase(),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold))
                      ]),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'It all Starts here.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text('Enter your email'),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          validator: (value) =>
                              value!.isEmpty || !emailRegex.hasMatch(value)
                                  ? 'Please enter a valid email'
                                  : null,
                          onChanged: (value) => setState(() => _email = value),
                          decoration: InputDecoration(
                            hintText: 'Ex: bayedieye.ba@gmail.com',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0.0),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(0.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        RaisedButton(
                          onPressed: !emailRegex.hasMatch(_email)
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    widget.onChangedStep(1, _email);
                                  }
                                },
                          color: Theme.of(context).primaryColor,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            'continuer'.toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
