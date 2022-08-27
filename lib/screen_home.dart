import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample_project/login.dart';
import 'package:sample_project/screen_1.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
void main(List<String> args) {}

class ListViewSample extends StatelessWidget {
  const ListViewSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat App'), actions: [
        IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.exit_to_app)),
      ]),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text('PERSON $index'),
              subtitle: Text('Message $index'),
              leading: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 203, 185, 19),
                backgroundImage: AssetImage('android/assets/images/Anshab.png'),
                radius: 30,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return MyWidget(name: 'PERSON $index');
                    },
                  ),
                );
              },
              trailing: Text('1$index:00pm'),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 50,
        ),
      ),
    );
  }

  signout(BuildContext ctx) async{
     final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => Login()), (route) => false);
  }
}
