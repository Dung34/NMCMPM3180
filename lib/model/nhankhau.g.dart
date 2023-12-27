// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nhankhau.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NhanKhauImpl _$$NhanKhauImplFromJson(Map<String, dynamic> json) =>
    _$NhanKhauImpl(
      nkid: json['nkid'] as String?,
      hovatendem: json['hovatendem'] as String?,
      ten: json['ten'] as String?,
      gioitinh: json['gioitinh'] as String?,
      ngaysinh: json['ngaysinh'] as String?,
      quanhe: json['quanhe'] as String?,
      cccd: json['cccd'] as String?,
      sodienthoai: json['sodienthoai'] as String?,
      fid: json['fid'] as int?,
    );

Map<String, dynamic> _$$NhanKhauImplToJson(_$NhanKhauImpl instance) =>
    <String, dynamic>{
      'nkid': instance.nkid,
      'hovatendem': instance.hovatendem,
      'ten': instance.ten,
      'gioitinh': instance.gioitinh,
      'ngaysinh': instance.ngaysinh,
      'quanhe': instance.quanhe,
      'cccd': instance.cccd,
      'sodienthoai': instance.sodienthoai,
      'fid': instance.fid,
    };
