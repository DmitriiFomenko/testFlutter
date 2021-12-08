import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LogState();
  }
}

class _LogState extends State<Log> {
  String login = '';
  String password = '';

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();

    initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text('Log' + login),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _fieldUser(),
                  _fieldPassword(),
                  _buttonLog(context),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12),
              alignment: Alignment.center,
              width: 600,
              height: 300,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20))),
    );
  }

  Widget _fieldUser() {
    return TextFormField(
        onChanged: (text) {
          login = text;
        },
        style: const TextStyle(fontSize: 22, color: Colors.black),
        maxLength: 20,
        maxLines: 1,
        decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'your username',
            labelText: 'Username *'));
  }

  Widget _fieldPassword() {
    return TextFormField(
        onChanged: (text) {
          password = text;
        },
        style: const TextStyle(fontSize: 22, color: Colors.black),
        maxLength: 20,
        maxLines: 1,
        obscureText: true,
        decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'your password',
            labelText: 'Password *'));
  }

  Widget _buttonLog(context) {
    return Align(
        alignment: Alignment.centerRight,
        child: FloatingActionButton.extended(
            heroTag: 'to home',
            onPressed: () {
              _logIn(context);
            },
            label: const Text('Войти')));
  }

  void _logIn(context) {
    var users = FirebaseFirestore.instance.collection('Users');
    
    Future<void> getData() async {
      QuerySnapshot querySnapshot = await users.get();

      if (querySnapshot.docs
          .where((element) =>
              element.get('Login') == login &&
              element.get('Password') == password)
          .isNotEmpty) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => const Home()),
            (route) => false);
        return;
      }

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Неправильный логин или пароль'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                )
              ],
            );
          });
    }

    getData();
  }
}