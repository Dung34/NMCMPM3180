import 'package:freezed_annotation/freezed_annotation.dart';
part 'f_id_response.g.dart';
part 'f_id_response.freezed.dart';

@freezed
class FIDResponse with _$FIDResponse {
  factory FIDResponse({
    int? fid,
    String? cccdchuho,
  }) = _FIDResponse;
  factory FIDResponse.fromJson(Map<String, dynamic> json) =>
      _$FIDResponseFromJson(json);
}
