import 'package:dio/dio.dart';
import 'package:flutter_app/data/connection/Api.dart';
import 'package:flutter_app/data/model/Poli.dart';

class PoliService {
  //Ambil Data Semua
  Future<List<Poli>> listData() async {
    final Response response = await Api().getData('poli');
    final List data = response.data['data'] as List;
    List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
    return result;
  }

  //Cari berdasarkan ID
  Future<Poli> getById(String id) async {
    final Response response = await Api().getData('poli/${id}');
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  //Hapus Data
  Future<Poli> delete(Poli poli) async {
    print('Deleting resource with ID: ${poli.id}');
    final Response response = await Api().delete('poli/${poli.id}');
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  //Tambah Data
  Future<Poli> simpan(Poli poli) async {
    var data = poli.toJson();
    final Response response = await Api().post("poli", data);
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  //Ubah Data
  Future<Poli> ubah(Poli poli, String id) async {
    var data = poli.toJson();
    final response = await Api().put("poli/${id}", data);
    print(response);
    Poli result = Poli.fromJson(response.data);
    return result;
  }
}
