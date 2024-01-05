import 'package:dio/dio.dart';
import 'package:flutter_app/data/connection/Api.dart';
import 'package:flutter_app/data/model/Pasien.dart';

class PasienService {
  Future<List<Pasien>> getData() async {
    final Response response = await Api().getData("pasien");
    final List data = response.data['data'] as List;
    List<Pasien> result = data.map((json) => Pasien.fromJson(json)).toList();
    return result;
  }

  Future<Pasien> simpan(Pasien pasien) async {
    final data = pasien.toJson();
    final Response response = await Api().post("pasien", data);
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<Pasien> hapus(Pasien pasien) async {
    final Response response = await Api().delete("pasien/${pasien.id}");
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }
}
