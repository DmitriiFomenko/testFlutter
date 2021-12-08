import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/buttons/buttons_page.dart';
import 'package:flutter_application_2/pages/log.dart';
import 'package:flutter_application_2/pages/home.dart';

void main() => runApp(MaterialApp(
      title: "App",
      routes: {
        '/': (BuildContext context) => const Log(),
        '/log': (BuildContext context) => const Log(),
        '/home': (BuildContext context) => const Home(),
        '/buttons': (BuildContext context) => const ButtonsPage(),
      },
    ));
