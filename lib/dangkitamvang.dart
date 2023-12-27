import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DangKiTamVang extends StatefulWidget {
  final int? cancuoc;
  final bool isTamVang;
  const DangKiTamVang({super.key, this.cancuoc, required this.isTamVang});

  @override
  State<DangKiTamVang> createState() => _DangKiTamTruState();
}

class _DangKiTamTruState extends State<DangKiTamVang> {
  final TextEditingController cccd = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  dangkitamvang() async {
    final Dio dio1 = Dio();
    try {
      final response1 = await dio1.post(
          'http://13.212.37.229:8080/api/DangKiTamVang',
          data: {"cccd": cccd, "datestart": startDate, "dateend": endDate});
      if (response1.statusCode == 200) {
        debugPrint(response1.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    if (!widget.isTamVang) {
      cccd.text = widget.cancuoc.toString();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text((widget.isTamVang) ? 'Đăng kí tạm vắng' : "Đăng kí tạm trú"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Căn cước công dân',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
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
                    controller: cccd,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Căn cước công dân"),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            const Text(
              'Ngày bắt đầu',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
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
                    controller: startDate,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Ngày bắt đầu"),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            const Text(
              'Ngày kết thúc',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
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
                    controller: endDate,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Ngày kết thúc"),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Future.delayed(const Duration(seconds: 2));
                        dangkitamvang();
                      },
                      child: const Text("Đăng kí")),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
