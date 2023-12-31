import 'package:flutter/material.dart';
import 'package:flutter_app/ui/beranda/beranda.dart';
import 'package:flutter_app/data/helper/user_info.dart';
import 'package:flutter_app/ui/login/login.dart';
import 'package:flutter_app/ui/poli_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Klinik',
        home: PoliPage()); //TOKEN == null ? Login() : Beranda()
  }
}
