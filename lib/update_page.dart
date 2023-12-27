import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/model/nhankhau/nhankhau2.dart';

class UpdatePage extends StatefulWidget {
  final NhauKhauM nhankhau;
  const UpdatePage({super.key, required this.nhankhau});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController fid = TextEditingController();
  final TextEditingController hotendem = TextEditingController();
  final TextEditingController ten = TextEditingController();
  final TextEditingController cccd = TextEditingController();
  final TextEditingController ngaysinh = TextEditingController();
  final TextEditingController sdt = TextEditingController();
  @override
  void didChangeDependencies() {
    fid.text = widget.nhankhau.fid.toString();
    hotendem.text = widget.nhankhau.hovatendem ?? "";
    ten.text = widget.nhankhau.ten ?? "";
    cccd.text = widget.nhankhau.cccd ?? "";
    ngaysinh.text = widget.nhankhau.ngaysinh ?? "";
    sdt.text = widget.nhankhau.sodienthoai ?? "";
    gioitinh = widget.nhankhau.gioitinh ?? "";
    quanhe = widget.nhankhau.quanhe ?? "";
    super.didChangeDependencies();
  }

  String? gioitinh, quanhe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.delete))],
        title: const Text(
          "Chỉnh sửa nhân khẩu",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Họ và tên đệm",
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
                      controller: hotendem,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Họ và tên đệm"),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Tên",
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
                      controller: ten,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Tên"),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Căn cước công dân ",
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
                      controller: cccd,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Căn cước công dân "),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Số điện thoại",
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
                      controller: sdt,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: "Mã hộ khẩu"),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                content: Text("Chỉnh sửa thành công"),
                              ),
                            );
                          },
                          child: Text("Xác nhận")),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
