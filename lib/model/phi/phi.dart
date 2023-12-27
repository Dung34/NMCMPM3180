class Phi {
  int? phiid;
  String? tenphi;
  String? datestart;
  String? dateend;
  int? money;

  Phi({this.phiid, this.tenphi, this.datestart, this.dateend, this.money});

  Phi.fromJson(Map<String, dynamic> json) {
    phiid = json['phiid'];
    tenphi = json['tenphi'];
    datestart = json['datestart'];
    dateend = json['dateend'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phiid'] = this.phiid;
    data['tenphi'] = this.tenphi;
    data['datestart'] = this.datestart;
    data['dateend'] = this.dateend;
    data['money'] = this.money;
    return data;
  }
}
