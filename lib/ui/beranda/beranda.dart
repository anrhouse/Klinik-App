import 'package:flutter/material.dart';
import 'package:flutter_app/data/helper/user_info.dart';
import 'package:flutter_app/widget/sidebar.dart';

class Beranda extends StatelessWidget {
  Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Beranda"),
      ),
      body: Center(
        child: Row(
          //menggabungkan text selamat datang dan _buildusername gunakan row()
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Selamat Datang "), _buildUsername()],
        ),
      ),
    );
  }

  //Mengambil username
  Widget _buildUsername() {
    return FutureBuilder<String?>(
      future: UserInfo().getUsername(),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        return Text('${snapshot.data}');
      },
    );
  }
}
