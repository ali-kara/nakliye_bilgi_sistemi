import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakliye_bilgi_sistemi/Api/auth_service.dart';
import 'package:nakliye_bilgi_sistemi/Core/navigation/navigation_manager.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_colors.dart';
import 'package:nakliye_bilgi_sistemi/Global/Constants/_images.dart';
import 'package:nakliye_bilgi_sistemi/Global/Utils/user_messages.dart';
import 'package:nakliye_bilgi_sistemi/Managers/shared_prefences.dart';
import 'package:nakliye_bilgi_sistemi/Managers/sofor_manager.dart';
import 'package:nakliye_bilgi_sistemi/Screens/giris_bilgi.dart';
import 'package:nakliye_bilgi_sistemi/ViewModels/sofor_login.dart';
import 'package:nakliye_bilgi_sistemi/Widgets/loading_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with NavigatorManager {
  bool isLoading = false;

  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  //var box = await Hive.openBox('mybox');

  @override
  void initState() {
    super.initState();
    checkForLogin();
  }

  checkForLogin() async {
    var isLogin = await HelperFunctions.getUserLoggedInStatus();

    if (isLogin ?? false == true) {
      if (mounted) {
        navigateToWidgetReplace(context, const GirisBilgi());
      }
    }
  }

  // getUserLoggedInStatus() async {
  //   await HelperFunctions.getUserLoggedInStatus().then((value) {
  //     if (value != null) {
  //       setState(() {
  //         _isSignedIn = value;
  //       });
  //     }
  //   });
  // }

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    isLoading = false;

    super.dispose();
  }

  _login() async {
    //if (currentState!.validate()) {}

    var data = SoforLogin(
      userName: userNameController.text,
      password: passwordController.text,
    );

    var res = await AuthService().login(data);

    if (res.success == true) {
      await HelperFunctions.saveUserLoggedInStatus(true);
      await HelperFunctions.saveUserNameSF(data.userName.toString());
      await SoforManager.saveString(SoforManager.userBolge, 'value');

      if (!mounted) return;

      navigateToWidgetReplace(context, const GirisBilgi());
    } else {
      if (!mounted) return;
      showSnackbarError(context, res.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    const btnGirisYap = 'Giriş Yap';
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(LOGO),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'MERHABA ${greeting()}',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 42,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Sisteme Girmek için bilgilerinizi giriniz',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextFormField(
                          controller: userNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Kullanıcı Adınız',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Kullanıcı Adı boş olamaz.";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Kullanıcı Adı boş olamaz.";
                            }
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Parolanız',
                            errorStyle:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                            // prefixText: 'example@alikara.dev',
                            // labelText: "Password",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: !isLoading
                            ? GestureDetector(
                                onTap: () async {
                                  _changeLoading();
                                  await _login();
                                  _changeLoading();
                                },
                                child: const Text(
                                  btnGirisYap,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ANA_MENU_BUTONLAR_ICI,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : FittedBox(
                                child: loadingWidget(),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
