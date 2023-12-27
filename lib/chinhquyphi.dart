// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:truysuatnhankhau/model/phi/phi.dart';
import 'package:truysuatnhankhau/model/quy/quy.dart';

class UpdatePhiQuy extends StatefulWidget {
  final Quy? quy;
  final Phi? phi;
  final bool isPhi;
  final bool isNew;
  const UpdatePhiQuy(
      {Key? key, this.quy, this.phi, required this.isPhi, required this.isNew})
      : super(key: key);

  @override
  State<UpdatePhiQuy> createState() => _UpdatePhiQuyState();
}

class _UpdatePhiQuyState extends State<UpdatePhiQuy> {
  @override
  void didChangeDependencies() {
    if (widget.isPhi) {
      tenphi.text = widget.phi?.tenphi ?? "";
      phiId.text = widget.phi?.phiid.toString() ?? "";
      sotien.text = widget.phi?.money.toString() ?? "";
      startDate.text = widget.phi?.datestart ?? "";
      endDate.text = widget.phi?.dateend ?? "";
    } else {
      tenphi.text = widget.quy?.tenquy ?? "";
      phiId.text = widget.quy?.quyid.toString() ?? "";
      sotien.text = widget.quy?.money.toString() ?? "";
      startDate.text = widget.quy?.datestart ?? "";
      endDate.text = widget.quy?.dateend ?? "";
    }
    super.didChangeDependencies();
  }

  final TextEditingController tenphi = TextEditingController();
  final TextEditingController phiId = TextEditingController();
  final TextEditingController sotien = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.isPhi) {
      return Scaffold(
        appBar: AppBar(
          title: Text((!widget.isNew) ? "Chỉnh sửa phí" : "Tạo phí mới"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tên quỹ',
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
                            controller: tenphi,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Tên quỹ"),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mã quỹ',
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
                            controller: phiId,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Mã quỹ"),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Số tiền',
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
                            controller: sotien,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Số tiền"),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ngày bắt đầu',
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
                            controller: startDate,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ngày bắt đầu"),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ngày kết thúc',
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
                            controller: endDate,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ngày kết thúc"),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Thông báo"),
                                      content: Text("Chỉnh sửa thành công"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Đóng"))
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  "Xác nhận",
                                  maxLines: 1,
                                )),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text((!widget.isNew) ? "Chỉnh sửa quỹ" : "Tạo quỹ mới"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tên quỹ',
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
                            controller: tenphi,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Tên phí"),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mã quỹ',
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
                            controller: phiId,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Mã Phí"),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Số tiền',
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
                            controller: sotien,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: "Số tiền"),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ngày bắt đầu',
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
                            controller: startDate,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ngày bắt đầu"),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ngày kết thúc',
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
                            controller: endDate,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ngày kết thúc"),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Thông báo"),
                                      content: Text("Chỉnh sửa thành công"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Đóng"))
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  "Xác nhận",
                                  maxLines: 1,
                                )),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ),
      );
    }
  }
}
