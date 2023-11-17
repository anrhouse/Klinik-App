import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/Poli.dart';
import 'package:flutter_app/data/service/PoliService.dart';
import 'package:flutter_app/ui/poli_page.dart';
import 'package:flutter_app/ui/poli_update_form.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;
  const PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  Future<Poli> deleteData(Poli poli) async {
    Poli data = await PoliService().delete(poli);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Poli'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.accessible),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliPage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Nama Poli : ${widget.poli.poli}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
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
                              PoliUpdateForm(poli: widget.poli)));
                },
                child: const Text("Edit"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
              //Hapus
              ElevatedButton(
                  child: const Text("Hapus"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    AlertDialog alertDialog = AlertDialog(
                      content: const Text("Hapus Data?"),
                      actions: [
                        //Ya
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              deleteData(widget.poli).then((value) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PoliPage()));
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
                            child: const Text("Tidak")),
                      ],
                    );
                    showDialog(
                        context: context, builder: (context) => alertDialog);
                  })
            ],
          )
        ],
      ),
    );
  }
}
