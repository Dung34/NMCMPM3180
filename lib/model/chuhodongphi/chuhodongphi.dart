class ChuHoDongPhi {
  String? magiadinh;
  String? tenchuho;

  ChuHoDongPhi({this.magiadinh, this.tenchuho});

  ChuHoDongPhi.fromJson(Map<String, dynamic> json) {
    magiadinh = json['magiadinh'];
    tenchuho = json['tenchuho'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['magiadinh'] = this.magiadinh;
    data['tenchuho'] = this.tenchuho;
    return data;
  }
}
