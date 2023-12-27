import 'package:flutter/material.dart';
import 'package:truysuatnhankhau/dangkitamvang.dart';
import 'package:truysuatnhankhau/list_phi.dart';
import 'package:truysuatnhankhau/list_user.dart';
import 'package:truysuatnhankhau/listquy.dart';
import 'package:truysuatnhankhau/main_page.dart';
import 'package:truysuatnhankhau/register.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Danh sách nhân khẩu"),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ListNhanKhau(),
                  )),
                ),
                ListTile(
                  title: const Text("Danh sách hộ nhân khẩu"),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  )),
                ),
                ListTile(
                  title: const Text("Đăng kí tạm vắng"),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const RegisterPage(isRegsister: false),
                  )),
                ),
                ListTile(
                  title: const Text("Đăng kí tạm trú"),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DangKiTamVang(
                      isTamVang: true,
                    ),
                  )),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text("Trang chủ"),
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("Trang thông tin"),
              ),
              Tab(
                child: Text("Quỹ, phí"),
              )
            ]),
          ),
          body: TabBarView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      final urrl = Uri.parse(
                          'https://www.24h.com.vn/du-bao-thoi-tiet-c568.html');
                      await launchUrl(urrl);
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              "asset/image/dubaothoitiet.jpg",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Dự báo thời tiết",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "Thông tin dự báo thời tiết ngày ${DateTime.now().day}/${DateTime.now().month}")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      final urrl = Uri.parse('https://baochinhphu.vn');
                      await launchUrl(urrl);
                    },
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all()),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              "asset/image/bao.jpg",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tin tức",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "Thông tin thời sự ngày ${DateTime.now().day}/${DateTime.now().month}")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ListQuy(),
                  )),
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.green,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ]),
                    child: const Center(
                      child: Text("Danh sách quỹ"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ListPhi(),
                  )),
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.green,
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ]),
                    child: const Center(
                      child: Text("Danh sách phí"),
                    ),
                  ),
                )
              ],
            )
          ])),
    );
  }
}
