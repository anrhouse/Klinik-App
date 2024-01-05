import 'package:dio/dio.dart';
import 'package:flutter_app/data/connection/Api.dart';
import 'package:flutter_app/data/model/Pegawai.dart';

class PegawaiService {
  //Ambil Data
  Future<List<Pegawai>> listData() async {
    final Response response = await Api().getData('pegawai');
    final List data = response.data['data'] as List;
    List<Pegawai> result = data.map((json) => Pegawai.fromJson(json)).toList();
    return result;
  }

  //Simpan Data
  Future<Pegawai> simpan(Pegawai pegawai) async {
    final data = pegawai.toJson();
    final Response response = await Api().post('pegawai', data);
    Pegawai result = Pegawai.fromJson(response.data);
    return result;
  }

  //delete
  Future<Pegawai> delete(Pegawai pegawai) async {
    print('Deleting resource with ID: ${pegawai.id}');
    final Response response = await Api().delete('pegawai/${pegawai.id}');
    Pegawai result = Pegawai.fromJson(response.data);
    return result;
  }

  //GetById
  Future<Pegawai> getById(String id) async {
    final Response response = await Api().getData('pegawai/${id}');
    Pegawai result = Pegawai.fromJson(response.data);
    return result;
  }

  //Ubah
  Future<Pegawai> ubah(Pegawai pegawai, String id) async {
    var data = pegawai.toJson();
    final Response response = await Api().put("pegawai/${id}", data);
    print(response);
    Pegawai result = Pegawai.fromJson(response.data);
    return result;
  }
}
