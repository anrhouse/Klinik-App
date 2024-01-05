import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/Pasien.dart';
import 'package:flutter_app/data/service/PasienService.dart';
import 'package:flutter_app/ui/pasien/pasien_page.dart';
import 'package:flutter_app/widget/sidebar.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;
  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  Future<Pasien> deleteData(Pasien pasien) async {
    Pasien data = await PasienService().hapus(pasien);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pasien"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(
                "Nomor RM : ${widget.pasien.nomor_rm}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Nama : ${widget.pasien.nama}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Tanggal Lahir : ${widget.pasien.tanggal_lahir}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Nomor Telp : ${widget.pasien.nomor_telepon}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Alamat : ${widget.pasien.alamat}",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Edit
              ElevatedButton(
                onPressed: () {},
                child: const Text("Edit"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),

              //Hapus
              ElevatedButton(
                onPressed: () {
                  AlertDialog alertDialog = AlertDialog(
                    content: const Text("Hapus Data?"),
                    actions: [
                      //Ya
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            deleteData(widget.pasien).then((value) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PasienPage()));
                            });
                          });
                        },
                        child: const Text("Ya"),
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
                child: const Text("Hapus"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}
