class Fid {
  int? magiadinh;
  String? tenchuho;
  String? diachi;

  Fid({this.magiadinh, this.tenchuho, this.diachi});

  Fid.fromJson(Map<String, dynamic> json) {
    magiadinh = json['magiadinh'];
    tenchuho = json['tenchuho'];
    diachi = json['diachi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['magiadinh'] = magiadinh;
    data['tenchuho'] = tenchuho;
    data['diachi'] = diachi;
    return data;
  }
}
