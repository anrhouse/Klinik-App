import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://apiklinik.kelasprojek.com/',
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 3000),
  ));

  //Ambil Semua Data
  Future<Response> getData(String path) async {
    final response = await dio.get(Uri.encodeFull(path));
    return response;
  }

  //Hapus Data
  Future<Response> delete(String path) async {
    final response = await dio.delete(Uri.encodeFull(path));
    return response;
  }

  //Tambah Data
  Future<Response> post(String path, dynamic data) async {
    final response = await dio.post(Uri.encodeFull(path), data: data);
    return response;
  }

  //Ubah Data
  Future<Response> put(String path, dynamic data) async {
    final response = await dio.put(Uri.encodeFull(path), data: data);
    return response;
  }
}
