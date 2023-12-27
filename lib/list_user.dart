import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:truysuatnhankhau/model/nhankhau/nhankhau2.dart';
import 'package:truysuatnhankhau/register.dart';
import 'package:truysuatnhankhau/search_page.dart';
import 'package:truysuatnhankhau/update_page.dart';

class ListNhanKhau extends StatefulWidget {
  const ListNhanKhau({super.key});

  @override
  State<ListNhanKhau> createState() => _ListNhanKhauState();
}

class _ListNhanKhauState extends State<ListNhanKhau> {
  List<NhauKhauM> listNhanKhau = [];
  Future getNhanKhau() async {
    final Dio dio = Dio();
    try {
      final response =
          await dio.get("http://13.212.37.229:8080/api/findNhanKhau");
      if (response.statusCode == 200) {
        debugPrint(response.data.runtimeType.toString());
        listNhanKhau = List.from(
            (response.data as List).map((e) => NhauKhauM.fromJson(e)));
        debugPrint(listNhanKhau[0].fid.toString());
      } else {
        debugPrint("Failed");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didChangeDependencies() async {
    getNhanKhau();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách nhân khẩu"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ));
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterPage(
                    isRegsister: true,
                  ),
                ));
              },
              icon: const Icon(Icons.add))
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: getNhanKhau(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(listNhanKhau[index].hovatendem ?? ""),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(listNhanKhau[index].ten ?? "")
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(listNhanKhau[index].cccd.toString()),
                        Text(listNhanKhau[index].gioitinh ?? "")
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          listNhanKhau.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UpdatePage(nhankhau: listNhanKhau[index]),
                          ));
                    },
                  ),
                );
              },
              itemCount: listNhanKhau.length,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}

class NhanKhauItem extends StatelessWidget {
  final NhauKhauM nhauKhauM;
  const NhanKhauItem({super.key, required this.nhauKhauM});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          // An action can be bigger than the others.
          flex: 1,
          onPressed: (context) {},
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      child: ListTile(
        title: Text(nhauKhauM.hovatendem! + " " + nhauKhauM.ten!),
        subtitle: Text(nhauKhauM.gioitinh!),
        trailing: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdatePage(nhankhau: nhauKhauM),
                  ));
            },
            icon: const Icon(Icons.edit)),
      ),
    );
  }
}
