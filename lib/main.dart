import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:truysuatnhankhau/login.dart';
import 'package:truysuatnhankhau/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Truy xuất nhân khẩu',
      theme: ThemeData.light(),
      // .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const WellcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login(String user, String password) async {
    try {
      // var response = await http.post(
      //     Uri.parse('http://13.212.37.229:8080/api/login'),
      //     body: {"username": "user", "password": "user2"});
      final Dio dio = Dio();
      var response = await dio.post('http://13.212.37.229:8080/api/login',
          data: {"username": "user", "password": "user2"});
      if (response.statusCode == 200) {
        String jsonString = response.data;
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        debugPrint(jsonMap['code']);
        if (jsonMap['code'] == "LOGIN001") {
          debugPrint("User");
        }
        if (jsonMap['code'] == "LOGIN002") {
          debugPrint("Admin");
        }
        debugPrint("LoginSuccessFully");
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: const Color(0xFFF3F5F9), width: 1),
                  ),
                  child: const Center(
                      child: Text(
                    "<",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  )),
                ),
              ],
            ),
            const Text(
              "Tên sản phẩm",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              'asset/icon/home.svg',
              height: 100,
              width: 100,
            ),
            const Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25, color: Colors.red, fontWeight: FontWeight.w800),
            ),
            Container(
              height: 50,
              width: 300,
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: "Username here ", icon: Icon(Icons.mail)),
              ),
            ),
            Container(
              height: 50,
              width: 300,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Password here ", icon: Icon(Icons.lock)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    login(usernameController.text.toString(),
                        passwordController.text.toString());
                    debugPrint('message');
                  },
                  child: const Center(
                    child: Text('Dang nhap'),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            Column(
              children: [
                const Text(
                  "Phần mềm quản lí",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  "Ứng dụng được phát triển bởi hợp tác xã phần mềm nhằm hỗ trợ mọi tổ chức liên quan trong việc truy suất thông tin nhân khẩu",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/image/welcome.png"))),
            ),
            Column(
              children: [
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Đăng nhập",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()));
                  },
                  color: const Color(0xff0095FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Đăng kí",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
