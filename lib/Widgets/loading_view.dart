import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget loadingWidget() {
  return const Center(
    child: CircularProgressIndicator.adaptive(),
  );
}

// const aa =
//     "https://lottie.host/3376b817-93e6-4fe4-a4d9-b0ddbbeb8415/nzhKPZcHKN.json";
// // AnimationController _controller = AnimationController(vsync: );

// Widget loadingWidget() {
//   return Center(
//     child: Lottie.network(
//       aa,

//       // controller: _controller,
//       animate: true,
//     ),
//   );
// }
