import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/Pegawai.dart';
import 'package:flutter_app/data/service/PegawaiService.dart';
import 'package:flutter_app/ui/pegawai/pegawai_page.dart';
import 'package:flutter_app/ui/pegawai/pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  Future<Pegawai> deleteData(Pegawai pegawai) async {
    Pegawai data = await PegawaiService().delete(pegawai);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pegawai"),
        actions: [],
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(
                "NIP : ${widget.pegawai.nip}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Nama : ${widget.pegawai.nama}",
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Tanggal Lahir : ${widget.pegawai.tanggal_lahir}",
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("No Telp : ${widget.pegawai.nomor_telepon}",
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Email : ${widget.pegawai.email}",
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Password : ${widget.pegawai.password}",
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Edit
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PegawaiUpdateForm(pegawai: widget.pegawai)));
                },
                child: const Text("Edit"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
              //Delete
              ElevatedButton(
                onPressed: () {
                  AlertDialog alertDialog = AlertDialog(
                    content: const Text("Hapus Data?"),
                    actions: [
                      //Ya
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            deleteData(widget.pegawai).then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PegawaiPage()));
                            });
                          });
                        },
                        child: const Text(
                          "Ya",
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                      //Tidak
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Tidak"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                      )
                    ],
                  );
                  showDialog(
                      context: context, builder: (context) => alertDialog);
                },
                child: const Text("Delete"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}
