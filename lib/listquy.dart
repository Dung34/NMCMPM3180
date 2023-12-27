import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/chinhquyphi.dart';
import 'package:truysuatnhankhau/dongquy.dart';
import 'package:truysuatnhankhau/model/quy/quy.dart';

class ListQuy extends StatefulWidget {
  const ListQuy({super.key});

  @override
  State<ListQuy> createState() => _ListQuyState();
}

class _ListQuyState extends State<ListQuy> {
  List<Quy> listQuy = [];
  getAllPhi() async {
    final Dio dio = Dio();
    try {
      final response =
          await dio.get("http://13.212.37.229:8080/api/findAllQuy");
      if (response.statusCode == 200) {
        listQuy =
            List.from((response.data as List).map((e) => Quy.fromJson(e)));
      } else {
        debugPrint("Troll");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    getAllPhi();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách quỹ "),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const UpdatePhiQuy(isPhi: false, isNew: true),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) => QuyItem(qui: listQuy[index]),
              itemCount: listQuy.length,
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

class QuyItem extends StatelessWidget {
  final Quy qui;
  const QuyItem({super.key, required this.qui});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
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
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(qui.tenquy ?? ""), Text(qui.money.toString())],
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DongQuy(quy: qui),
                            ));
                      },
                      child: Text("Nộp tiền")),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UpdatePhiQuy(
                            isPhi: false,
                            quy: qui,
                            isNew: false,
                          ),
                        ));
                      },
                      icon: Icon(Icons.edit)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
