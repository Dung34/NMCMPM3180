import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/dangkitamvang.dart';

class RegisterPage extends StatefulWidget {
  final bool isRegsister;
  const RegisterPage({super.key, required this.isRegsister});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController hotendem = TextEditingController();
  final TextEditingController ten = TextEditingController();
  final TextEditingController ngaysinh = TextEditingController();
  final TextEditingController cccd = TextEditingController();
  final TextEditingController sdt = TextEditingController();
  final TextEditingController fid = TextEditingController();
  //địa chỉ
  final TextEditingController thanhpho = TextEditingController();
  final TextEditingController quan = TextEditingController();
  final TextEditingController phuong = TextEditingController();
  final TextEditingController duong = TextEditingController();
  final TextEditingController sonha = TextEditingController();
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
          "sonha": sonha.text.trim(),
          "duong": duong.text.trim(),
          "phuong": phuong.text.trim(),
          "quan": quan.text.trim(),
          "thanhPho": thanhpho.text.trim()
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

  String? gioitinh = "Nam", quanhe = "Con";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.isRegsister) ? "Đăng kí nhân khẩu" : "Đăng kí tạm trú",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        decoration: InputDecoration(
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
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Ngày sinh"),
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
                        decoration: InputDecoration(
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
                        decoration: InputDecoration(
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
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Mã hộ khẩu"),
                      ),
                    )),
                const Text('Địa chỉ'),
                SizedBox(height: 10),
                const Text(
                  'Thành phố',
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
                        controller: thanhpho,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Thành phố"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Tên quận',
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
                        controller: quan,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Quận"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Tên phường',
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
                        controller: phuong,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Phường"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Đường',
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
                        controller: duong,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Đường"),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  'Số nhà',
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
                        controller: sonha,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Số nhà"),
                      ),
                    )),
                // DropdownButton(
                //   items: [],
                //   onChanged: (value) {},
                //
                SizedBox(
                  height: 15,
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
                            if (!widget.isRegsister) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DangKiTamVang(
                                  isTamVang: false,
                                  cancuoc: int.parse(cccd.text),
                                ),
                              ));
                            }
                          },
                          child: Text(
                              (widget.isRegsister) ? "Đăng kí" : "Tiếp theo")),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
