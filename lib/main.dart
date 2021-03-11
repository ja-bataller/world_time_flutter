import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loader.dart';
import 'package:world_time/pages/location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loader(),
    '/home': (context) => Home(),
    '/location': (context) => Location(),
  },
));
