class Quy {
  int? quyid;
  String? tenquy;
  String? datestart;
  String? dateend;
  int? money;

  Quy({this.quyid, this.tenquy, this.datestart, this.dateend, this.money});

  Quy.fromJson(Map<String, dynamic> json) {
    quyid = json['quyid'];
    tenquy = json['tenquy'];
    datestart = json['datestart'];
    dateend = json['dateend'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quyid'] = this.quyid;
    data['tenquy'] = this.tenquy;
    data['datestart'] = this.datestart;
    data['dateend'] = this.dateend;
    data['money'] = this.money;
    return data;
  }
}
