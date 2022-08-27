import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/main.dart';
import 'package:sample_project/screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {}

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isDataMatched = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your phone.no',
                    ),
                    validator: (value) {
                      // if (_isDataMatched) {
                      //   return null;
                      // } else {
                      //   return 'Error';
                      // }
                      if (value == null || value.isEmpty) {
                        return 'Value is Empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    // if (_isDataMatched) {
                    //   return null;
                    // } else {
                    //   return 'Error';
                    // }
                    if (value == null || value.isEmpty) {
                      return 'Value is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDataMatched,
                      child: Text(
                        'Enter Data Doesnot match',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('Data empty');
                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      print('Username pass match');

      //Goto Home
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => ListViewSample()));
    } else {
      print('Username pass doesnot match');
    }
  }
}
