import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/chinhquyphi.dart';
import 'package:truysuatnhankhau/danhsanhdongphi.dart';
import 'package:truysuatnhankhau/dongphi.dart';
import 'package:truysuatnhankhau/model/phi/phi.dart';

class ListPhi extends StatefulWidget {
  const ListPhi({super.key});

  @override
  State<ListPhi> createState() => _ListPhiState();
}

class _ListPhiState extends State<ListPhi> {
  List<Phi> listPhi = [];
  Future getAllPhi() async {
    final Dio dio = Dio();
    try {
      final response = await dio.get("http://13.212.37.229:8080/api/AllPhi");
      if (response.statusCode == 200) {
        listPhi =
            List.from((response.data as List).map((e) => Phi.fromJson(e)));
      } else {
        debugPrint("Troll");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getAllPhi();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Các loại chi phí"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UpdatePhiQuy(isPhi: true, isNew: true),
                ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: getAllPhi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) => PhiItem(
                phi: listPhi[index],
              ),
              itemCount: listPhi.length,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}

class PhiItem extends StatelessWidget {
  final Phi phi;
  const PhiItem({super.key, required this.phi});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Danhsachdongphi(phi: phi),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tên phí: ${phi.tenphi}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text("Số tiền: ${phi.money}"),
                      Text("Ngày bắt đầu: ${phi.datestart}"),
                      Text("Ngày hết hạn: ${phi.dateend}")
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdatePhiQuy(
                                isPhi: true,
                                phi: phi,
                                isNew: false,
                              ),
                            ));
                      },
                      icon: const Icon(Icons.edit))
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DongPhi(phi: phi),
                        ));
                  },
                  child: Text("Nộp tiền"))
            ],
          ),
        ),
      ),
    );
  }
}
