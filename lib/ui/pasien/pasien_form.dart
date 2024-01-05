import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/Pasien.dart';
import 'package:flutter_app/data/service/PasienService.dart';
import 'package:flutter_app/ui/pasien/pasien_page.dart';
import 'package:intl/intl.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Nomor Rm"),
                  items: List<String>.generate(
                          10, (i) => (i + 1).toString().padLeft(2, '0'))
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    _nomorRmCtrl.text = newValue!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isi Nomor RM";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nama Pasien"),
                  controller: _namaCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isi Nama";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Tanggal Lahir"),
                  controller: _tanggalLahirCtrl,
                  onTap: () async {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now());
                    if (picked != null) {
                      _tanggalLahirCtrl.text =
                          DateFormat('yyyy-MM-dd').format(picked);
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isi Tanggal lahir";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Nomor Whatsapp"),
                  controller: _nomorTeleponCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isi No Whatsapp";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Alamat"),
                  controller: _alamatCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isi Alamat";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Pasien pasien = new Pasien(
                            nomor_rm: _nomorRmCtrl.text,
                            nama: _namaCtrl.text,
                            tanggal_lahir: _tanggalLahirCtrl.text,
                            nomor_telepon: _nomorTeleponCtrl.text,
                            alamat: _alamatCtrl.text);
                        await PasienService().simpan(pasien).then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasienPage()));
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
