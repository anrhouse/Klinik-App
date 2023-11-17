class Poli {
  int? id;
  String? poli;

  Poli({this.id, this.poli});

  factory Poli.fromJson(Map<String, dynamic> json) =>
      Poli(id: json['id'], poli: json['poli']);

  Map<String, dynamic> toJson() => {'poli': poli};
}
