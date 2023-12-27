import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:truysuatnhankhau/model/f_id_response.dart';
import 'package:truysuatnhankhau/model/fid/fid.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List listFids = [];
  Future getFid() async {
    final Dio dio = Dio();
    try {
      final response =
          await dio.get("http://13.212.37.229:8080/api/findAllFid");
      if (response.statusCode == 200) {
        // debugPrint(response.data.toString());
        debugPrint(response.data.runtimeType.toString());
        listFids =
            List.from((response.data as List).map((e) => Fid.fromJson(e)));
        debugPrint(listFids[1].runtimeType.toString());
        // Map<String, dynamic> convertListToMap(List<dynamic> list) {
        //   Map<String, dynamic> map = {};
        //   for (int i = 0; i < list.length; i += 2) {
        //     map[list[i]] = list[i + 1];
        //   }
        //   return map;
        // }

        // Map<String, dynamic> map =
        //     convertListToMap(response.data as List<dynamic>);
        // debugPrint(map.runtimeType.toString());
        debugPrint("Successfully");
      } else {
        debugPrint("Falied");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    getFid();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thông tin hộ nhân khẩu')),
      body: SafeArea(
          child: FutureBuilder(
        future: getFid(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  FIDItem(fidResponse: listFids[index]),
              itemCount: listFids.length,
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      )),
    );
  }
}

class FIDItem extends StatelessWidget {
  final Fid fidResponse;
  const FIDItem({super.key, required this.fidResponse});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          // An action can be bigger than the others.
          flex: 2,
          onPressed: (context) {},
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      child: ListTile(
        title: Text("Chủ hộ: ${fidResponse.tenchuho}"),
        subtitle: Text("Địa chị: ${fidResponse.diachi}"),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
