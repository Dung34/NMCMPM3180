import 'package:freezed_annotation/freezed_annotation.dart';

part 'nhankhau.g.dart';
part 'nhankhau.freezed.dart';

@freezed
class NhanKhau with _$NhanKhau {
  factory NhanKhau({
    String? nkid,
    String? hovatendem,
    String? ten,
    String? gioitinh,
    String? ngaysinh,
    String? quanhe,
    String? cccd,
    String? sodienthoai,
    int? fid,
  }) = _NhanKhau;
  factory NhanKhau.fromJson(Map<String, dynamic> json) =>
      _$NhanKhauFromJson(json);
}
