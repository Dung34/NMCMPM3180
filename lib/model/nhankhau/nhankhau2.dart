class NhauKhauM {
  int? nkid;
  String? hovatendem;
  String? ten;
  String? gioitinh;
  String? ngaysinh;
  String? quanhe;
  String? cccd;
  String? sodienthoai;
  int? fid;

  NhauKhauM(
      {this.nkid,
      this.hovatendem,
      this.ten,
      this.gioitinh,
      this.ngaysinh,
      this.quanhe,
      this.cccd,
      this.sodienthoai,
      this.fid});

  NhauKhauM.fromJson(Map<String, dynamic> json) {
    nkid = json['nkid'];
    hovatendem = json['hovatendem'];
    ten = json['ten'];
    gioitinh = json['gioitinh'];
    ngaysinh = json['ngaysinh'];
    quanhe = json['quanhe'];
    cccd = json['cccd'];
    sodienthoai = json['sodienthoai'];
    fid = json['fid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nkid'] = this.nkid;
    data['hovatendem'] = this.hovatendem;
    data['ten'] = this.ten;
    data['gioitinh'] = this.gioitinh;
    data['ngaysinh'] = this.ngaysinh;
    data['quanhe'] = this.quanhe;
    data['cccd'] = this.cccd;
    data['sodienthoai'] = this.sodienthoai;
    data['fid'] = this.fid;
    return data;
  }
}
