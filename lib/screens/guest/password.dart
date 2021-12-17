import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  final Function(int, String) onChangedStep;
  const PasswordPage({required this.onChangedStep});
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password = '';
  bool _isSecret = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => widget.onChangedStep(0, ''),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                Text(
                  'password'.toUpperCase(),
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Enter your password'),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          onChanged: (value) =>
                              setState(() => _password = value),
                          obscureText: _isSecret,
                          validator: (value) => value!.length < 6
                              ? 'Enter a password. 6 caracters min required.'
                              : null,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _isSecret = !_isSecret;
                                });
                              },
                              child: Icon(!_isSecret
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            hintText: 'Ex: gh!D4yqb',
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
                          onPressed: _password.length < 6
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    widget.onChangedStep(0, _password);
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
