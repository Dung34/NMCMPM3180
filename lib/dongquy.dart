import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/model/quy/quy.dart';

class DongQuy extends StatefulWidget {
  final Quy quy;
  const DongQuy({super.key, required this.quy});

  @override
  State<DongQuy> createState() => _DongQuyState();
}

class _DongQuyState extends State<DongQuy> {
  final TextEditingController fid = TextEditingController();
  final TextEditingController sotien = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đóng quỹ"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Tên quỹ"), Text(widget.quy.tenquy ?? "")],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Mã hộ khẩu",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 55,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: fid,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Mã hộ khẩu"),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Số tiền",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 55,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: sotien,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Số tiền"),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Thông báo"),
                            content: Text("Đóng quỹ thành công"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Đóng")),
                              TextButton(
                                  onPressed: () {}, child: Text("In biên lai"))
                            ],
                          ),
                        );
                      },
                      child: Text("Xác nhận")),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
