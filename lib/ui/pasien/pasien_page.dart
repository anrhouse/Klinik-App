import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/Pasien.dart';
import 'package:flutter_app/data/service/PasienService.dart';
import 'package:flutter_app/ui/pasien/pasien_form.dart';
import 'package:flutter_app/ui/pasien/pasien_item.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  Stream<List<Pasien>> getData() async* {
    List<Pasien> data = await PasienService().getData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasienForm()));
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: Text("Loading ..."),
              );
            } else if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Text("Data Kosong"),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return PasienItem(pasien: snapshot.data[index]);
                  });
            }
          }),
    );
  }
}
