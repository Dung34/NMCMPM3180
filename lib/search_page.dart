import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tìm kiếm thông tin")),
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all()),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: "Tìm theo số điện thoại"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all()),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: "Tìm theo căn cước công dân"),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: 100,
          child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Thông tin nhân khẩu"),
                          content: Column(children: [
                            Text("Thông tin nhân khẩu"),
                            Text("Thông tin nhân khẩu"),
                            Text("Thông tin nhân khẩu"),
                          ]),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Đóng"))
                          ],
                        ));
              },
              child: Text("Tìm kiếm")),
        )
      ])),
    );
  }
}
