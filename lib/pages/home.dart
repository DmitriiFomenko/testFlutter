import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/log.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    _blockProfile(),
                    const Divider(
                      height: 20,
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buttonToLog(context),
                        _buttonToButtons(context),
                      ],
                    ),
                  ],
                ))));
  }
}

Expanded _blockProfile() {
  return Expanded(
    child: Container(
      alignment: Alignment.topCenter,
      width: 1000,
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      child: const Text(
        'My profile',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.shade100,
      ),
    ),
    flex: 1,
  );
}

Expanded _buttonToLog(context) {
  return Expanded(
    child: Align(
        //alignment: Alignment.centerRight,
        child: FloatingActionButton.extended(
          heroTag: 'to log',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const Log()),
                                (route) => false);
            },
            label: const Text('To log'))),
    flex: 3,
  );
}

Expanded _buttonToButtons(context) {
  return Expanded(
    child: Align(
        //alignment: Alignment.centerRight,
        child: FloatingActionButton.extended(
          heroTag: 'to buttons',
            onPressed: () {
              Navigator.pushNamed(context, '/buttons');
            },
            label: const Text('To buttons'))),
    flex: 3,
  );
}