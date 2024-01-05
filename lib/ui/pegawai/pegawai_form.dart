import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/Pegawai.dart';
import 'package:flutter_app/data/service/PegawaiService.dart';
import 'package:flutter_app/ui/pegawai/pegawai_page.dart';
import 'package:intl/intl.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pegawai"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "NIP"),
                  controller: _nipCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isi NIP";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nama Pegawai"),
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
                  decoration: const InputDecoration(labelText: "Email"),
                  controller: _emailCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan Email";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                        .hasMatch(value)) {
                      return "Masukkan format email yang valid";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Password"),
                  controller: _passwordCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Isi password";
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
                        Pegawai pegawai = new Pegawai(
                            nip: _nipCtrl.text,
                            nama: _namaCtrl.text,
                            tanggal_lahir: _tanggalLahirCtrl.text,
                            nomor_telepon: _nomorTeleponCtrl.text,
                            email: _emailCtrl.text,
                            password: _passwordCtrl.text);
                        await PegawaiService().simpan(pegawai).then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PegawaiPage()));
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
