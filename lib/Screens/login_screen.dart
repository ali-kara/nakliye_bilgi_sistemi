import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakliye_bilgi_sistemi/Api/auth_service.dart';
import 'package:nakliye_bilgi_sistemi/Model/sofor.dart';
import 'package:nakliye_bilgi_sistemi/Screens/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/Screens/home_screen.dart';

import '../Global/Constants/_colors.dart';
import '../Global/Constants/_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  //var box = await Hive.openBox('mybox');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    isLoading = false;

    super.dispose();
  }

  _login() async {
    var data = soforLogin(
      kodu: userNameController.text,
      parola: passwordController.text,
    );

    var res = await AuthService().login(data);

    if (res) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GirisBilgi(),
        ),
      );
    } else {
      const AlertDialog(
        content: Text("Giriş Yapılamadı."),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(LOGO),
                ),
                const SizedBox(height: 15),
                Text('MERHABA ${greeting()}',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 42,
                    )),
                const SizedBox(height: 15),
                const Text(
                  'Sisteme Girmek için bilgilerinizi giriniz',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Kullanıcı Adınız',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Parolanız',
                          //labelText: "Password"
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.blue[700],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: !isLoading
                          ? InkWell(
                              onTap: () async {
                                _changeLoading();
                                await _login();
                                _changeLoading();
                              },
                              child: const Text(
                                'Giriş Yap',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : const CircularProgressIndicator.adaptive(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'GÜNAYDIN';
  }
  if (hour < 17) {
    return 'İYİ GÜNLER';
  }
  return 'İYİ GECELER';
}
