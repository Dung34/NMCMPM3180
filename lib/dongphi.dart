import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/list_phi.dart';
import 'package:truysuatnhankhau/model/phi/phi.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class DongPhi extends StatefulWidget {
  final Phi phi;
  const DongPhi({super.key, required this.phi});

  @override
  State<DongPhi> createState() => _DongPhiState();
}

class _DongPhiState extends State<DongPhi> {
  final TextEditingController fid = TextEditingController();
  final TextEditingController sotien = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đóng phí"),
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
            const SizedBox(
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
                            title: const Text("Thông báo"),
                            content: const Text("Thanh toán thành công"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Đóng")),
                              TextButton(
                                  onPressed: () async {
                                    final urrl = Uri.parse(
                                        'http://13.212.37.229:8080/api/pdf/xuatbienlai?phiid=5&fid=20000');
                                    await launchUrl(urrl);
                                  },
                                  child: const Text("In biên lai"))
                            ],
                          ),
                        );
                      },
                      child: const Text("Xác nhận")),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
