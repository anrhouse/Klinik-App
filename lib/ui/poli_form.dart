import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/Poli.dart';
import 'package:flutter_app/data/service/PoliService.dart';
import 'package:flutter_app/ui/poli_page.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Poli"),
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
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nama Poli"),
                  controller: _namaPoliCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isi nama Poli";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Poli poli = new Poli(poli: _namaPoliCtrl.text);
                        await PoliService().simpan(poli).then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PoliPage()));
                        });
                      }
                    },
                    child: const Text("Simpan"))
              ],
            )),
      ),
    );
  }
}
