import 'package:flutter/material.dart';
import 'package:flutter_app/ui/beranda/beranda.dart';
import 'package:flutter_app/ui/login/login.dart';
import 'package:flutter_app/ui/pasien/pasien_page.dart';
import 'package:flutter_app/ui/pegawai/pegawai_page.dart';
import 'package:flutter_app/ui/poli_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Admin'),
              accountEmail: Text("admin@klinik.com")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),
          ListTile(
            leading: Icon(Icons.roofing_rounded),
            title: Text("Poli"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Pegawai"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PegawaiPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.accessible),
            title: Text("Pasien"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasienPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          )
        ],
      ),
    );
  }
}
