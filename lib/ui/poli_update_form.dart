import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/Poli.dart';
import 'package:flutter_app/data/service/PoliService.dart';
import 'package:flutter_app/ui/poli_page.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;
  const PoliUpdateForm({super.key, required this.poli});

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  Future<Poli> getData() async {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    setState(() {
      _namaPoliCtrl.text = widget.poli.poli.toString();
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update Poli"),
          actions: [
            GestureDetector(
              child: const Icon(Icons.accessible),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PoliPage()));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Nama Poli"),
                    controller: _namaPoliCtrl,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Isi Data Poli";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Poli poli = new Poli(poli: _namaPoliCtrl.text);
                          //String id = widget.poli.id.toString();
                          await PoliService()
                              .ubah(poli, widget.poli.id.toString())
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PoliPage()));
                          });
                        }
                      },
                      child: Text("Update"))
                ],
              )),
        ));
  }
}
