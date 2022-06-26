// import 'package:flutter/material.dart';
// import 'package:nakliye_bilgi_sistemi/Screens/home_screen.dart';

// import '../Snippets/background.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Background(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               alignment: Alignment.centerLeft,
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: const Text(
//                 "LOGIN",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF2661FA),
//                   fontSize: 36
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//             ),

//             SizedBox(height: size.height * 0.03),

//             Container(
//               alignment: Alignment.center,
//               margin: const EdgeInsets.symmetric(horizontal: 40),
//               child: const TextField(
//                 decoration: InputDecoration(
//                   labelText: "Username"
//                 ),
//               ),
//             ),

//             SizedBox(height: size.height * 0.03),

//             Container(
//               alignment: Alignment.center,
//               margin: const EdgeInsets.symmetric(horizontal: 40),
//               child: const TextField(
//                 decoration: InputDecoration(
//                   labelText: "Password"
//                 ),
//                 obscureText: true,
//               ),
//             ),

//             Container(
//               alignment: Alignment.centerRight,
//               margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               child: const Text(
//                 "Forgot your password?",
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Color(0XFF2661FA)
//                 ),
//               ),
//             ),

//             SizedBox(height: size.height * 0.05),

//             Container(
//               alignment: Alignment.centerRight,
//               margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               child: RaisedButton(
//                 onPressed: () {},
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
//                 textColor: Colors.white,
//                 padding: const EdgeInsets.all(0),
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 50.0,
//                   width: size.width * 0.5,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(80.0),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Color.fromARGB(255, 255, 136, 34),
//                         Color.fromARGB(255, 255, 177, 41)
//                       ]
//                     )
//                   ),
//                   padding: const EdgeInsets.all(0),
//                   child: const Text(
//                     "LOGIN",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             Container(
//               alignment: Alignment.centerRight,
//               margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               child: GestureDetector(
//                 onTap: () => {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()))
//                 },
//                 child: const Text(
//                   "Don't Have an Account? Sign up",
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF2661FA)
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.UtilityClickedEvent);
                  },
                  child: const Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                SizedBox(height: 10),
                Text("Messages",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Utility Bills",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Funds Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Branches",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard() {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: const Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (isCollapsed) {
                              _controller.forward();
                            } else {
                              _controller.reverse();
                            }

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      const Text("My Cards",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      const Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.redAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.blueAccent,
                          width: 100,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          color: Colors.greenAccent,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Transactions",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const ListTile(
                          title: Text("Macbook"),
                          subtitle: Text("Apple"),
                          trailing: Text("-2900"),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(height: 16);
                      },
                      itemCount: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
