import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/model/chuhodongphi/chuhodongphi.dart';
import 'package:truysuatnhankhau/model/phi/phi.dart';

class Danhsachdongphi extends StatefulWidget {
  final Phi phi;
  const Danhsachdongphi({super.key, required this.phi});

  @override
  State<Danhsachdongphi> createState() => _DanhsachdongphiState();
}

class _DanhsachdongphiState extends State<Danhsachdongphi> {
  List<ChuHoDongPhi> listChuho = [];
  Future getListHODongPhi() async {
    final Dio dio = Dio();
    try {
      final response = await dio.get(
          "http://13.212.37.229:8080/api/listFidOfPhi?phiid=5",
          queryParameters: {"phiid": widget.phi.phiid});
      if (response.statusCode == 200) {
        listChuho = List.from(
            (response.data as List).map((e) => ChuHoDongPhi.fromJson(e)));
        debugPrint("Nice");
      } else {
        debugPrint("Troll");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didChangeDependencies() async {
    await getListHODongPhi();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sách gia đình đã thanh toán")),
      body: SafeArea(
          child: FutureBuilder(
        future: getListHODongPhi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  ChuHoItem(chuHoDongPhi: listChuho[index]),
              itemCount: listChuho.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

class ChuHoItem extends StatelessWidget {
  final ChuHoDongPhi chuHoDongPhi;
  const ChuHoItem({super.key, required this.chuHoDongPhi});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Tên chủ hộ:   ${chuHoDongPhi.tenchuho}"),
      subtitle: Text(chuHoDongPhi.magiadinh ?? ""),
    );
  }
}
