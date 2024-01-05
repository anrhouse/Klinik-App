import 'package:flutter/material.dart';
import 'package:flutter_app/data/service/PegawaiService.dart';
import 'package:flutter_app/data/model/Pegawai.dart';
import 'package:flutter_app/ui/pegawai/pegawai_form.dart';
import 'package:flutter_app/ui/pegawai/pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  Stream<List<Pegawai>> getList() async* {
    List<Pegawai> data = await PegawaiService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          )
        ],
      ),
      body: StreamBuilder(
          stream: getList(),
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
                    return PegawaiItem(pegawai: snapshot.data[index]);
                  });
            }
          }),
    );
  }
}
