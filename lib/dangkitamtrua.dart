import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DangKiTamTru extends StatefulWidget {
  const DangKiTamTru({super.key});

  @override
  State<DangKiTamTru> createState() => _DangKiTamTruState();
}

class _DangKiTamTruState extends State<DangKiTamTru> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController hotendem = TextEditingController();
    final TextEditingController ten = TextEditingController();
    final TextEditingController ngaysinh = TextEditingController();
    final TextEditingController cccd = TextEditingController();
    final TextEditingController sdt = TextEditingController();
    final TextEditingController fid = TextEditingController();
    final TextEditingController sonha = TextEditingController();
    final TextEditingController phuong = TextEditingController();
    final TextEditingController quan = TextEditingController();
    final TextEditingController thanhpho = TextEditingController();
    final TextEditingController duong = TextEditingController();
    final TextEditingController dstart = TextEditingController();
    final TextEditingController dend = TextEditingController();
    String? gioitinh, quanhe;
    register() async {
      final Dio dio = Dio();
      try {
        final response =
            await dio.post("http://13.212.37.229:8080/api/addnhankhau", data: {
          "hovatendem": hotendem.text.trim(),
          "ten": ten.text.trim(),
          "gioitinh": gioitinh,
          "ngaysinh": ngaysinh.text.trim(),
          "quanhe": quanhe,
          "cccd": cccd.text.trim(),
          "sodienthoai": sdt.text.trim(),
          "f_id": int.parse(fid.text),
          "DiaChi": {
            "sonha": sonha,
            "duong": duong,
            "phuong": phuong,
            "quan": quan,
            "thanhPho": thanhpho
          }
        });
        if (response.statusCode == 200) {
          debugPrint("DangkiThanhCong");
          debugPrint(response.data.toString());
        } else {
          debugPrint("OnloiLia");
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    dangkitamtru() async {
      final Dio dio1 = Dio();
      try {
        final response1 = await dio1.post(
            'http://13.212.37.229:8080/api/DangKiTamTru',
            data: {"cccd": cccd, "datestart": dstart, "dateend": dend});
        if (response1.statusCode == 200) {
          debugPrint(response1.data);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Đăng kí tạm trú"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Họ và tên đệm',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
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
                            controller: hotendem,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Họ và tên đệm"),
                          ),
                        )),
                    const Text(
                      "Tên",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
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
                            controller: ten,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Tên"),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Giới tính',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        DropdownButton(
                          hint: const Text("Giới tính"),
                          items: const [
                            DropdownMenuItem(
                                value: "Nam",
                                child: Center(
                                  child: Text("Nam"),
                                )),
                            DropdownMenuItem(
                                value: "Nu",
                                child: Center(
                                  child: Text("Nu"),
                                ))
                          ],
                          value: gioitinh,
                          onChanged: (value) {
                            setState(() {
                              gioitinh = value;
                            });
                          },
                        ),
                      ],
                    ),

                    const Text(
                      "Ngày sinh",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
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
                            controller: ngaysinh,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ngày sinh"),
                          ),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Quan hệ với chủ hộ'),
                        DropdownButton(
                          hint: const Text("Quan he"),
                          value: quanhe,
                          items: const [
                            DropdownMenuItem(
                                value: "Con",
                                child: Center(
                                  child: Text("Con"),
                                )),
                            DropdownMenuItem(
                                value: "Chủ hộ",
                                child: Center(
                                  child: Text("Chủ hộ"),
                                ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              quanhe = value;
                            });
                          },
                        ),
                      ],
                    ),

                    const Text(
                      'Căn cước công dân',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
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
                    const Text(
                      "Số điện thoại",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
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
                            controller: sdt,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Số điện thoại"),
                          ),
                        )),
                    const Text(
                      'Mã số hộ gia đình',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
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
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mã hộ khẩu"),
                          ),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Text('Địa chỉ'),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Thành phố"),
                            Container(
                                height: 45,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                    controller: thanhpho,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Thành phố"),
                                  ),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Quận"),
                            Container(
                                height: 45,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                    controller: quan,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Quận"),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Phường"),
                            Container(
                                height: 45,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                    controller: phuong,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Phường"),
                                  ),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Đường"),
                            Container(
                                height: 45,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                    controller: duong,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Đường"),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Số nhá "),
                            Container(
                                height: 45,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                    controller: sonha,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Số nhà"),
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      'Ngày bắt đầu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
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
                            controller: dstart,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ngày bắt đầu"),
                          ),
                        )),
                    const Text(
                      'Ngày kết thúc',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
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
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ngày kết thúc"),
                          ),
                        )),
                    // DropdownButton(
                    //   items: [],
                    //   onChanged: (value) {},
                    //
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
                                debugPrint("${hotendem.text} ${ten.text} ");
                                register();
                                Future.delayed(const Duration(seconds: 2));
                                dangkitamtru();
                              },
                              child: const Text("Đăng kí")),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
