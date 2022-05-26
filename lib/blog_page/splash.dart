import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/authbloc.dart';
import '../bloc/auth/authevent.dart';

// import '../pages/showup.dart';
// import '../utilities/displayutil.dart';
// import '../utilities/theme-color.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => new SplashPageState();
}

class SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController? animationController;
  Animation<double>? animation;
  AuthenticationBloc? bloc;
  bool _isDone = false;
  bool _isRun = false;

  @override
  void initState() {
    super.initState();
    _isDone = false;
    _isRun = false;
    initSystem();
    bloc = BlocProvider.of<AuthenticationBloc>(context);
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = CurvedAnimation(
        parent: animationController!, curve: Curves.easeOutCirc);

    animation!.addListener(() => setState(() {}));
    animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isRun = true;
        animationController!.dispose();
        animationController = null;
        if (_isDone) {
          bloc!.add(CheckAuth());
        }
      }
    });
    animationController!.forward();

    setState(() {
      _visible = !_visible;
    });
    //startTime();
  }

  Future initSystem() async {
    _isDone = true;
    if (_isRun) {
      bloc!.add(CheckAuth());
    }
  }

  @override
  void dispose() {
    super.dispose();
    //animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Powered By Wincom IT Solutions",
                    style: TextStyle(fontSize: 15),
                  )
                  // new Image.asset(
                  //   'assets/images/powered_by.png',
                  //   height: 25.0,
                  //   fit: BoxFit.scaleDown,
                  // )
                  )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                width: animation!.value * 250,
                height: animation!.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class SplashPage extends StatefulWidget {
//   //final AuthenticationBloc bloc;
//   SplashPage(); //this.bloc);

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
//   AnimationController controller;
//   Animation<double> animation;
//   AuthenticationBloc bloc;
//   double _curScaleFactor = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     _curScaleFactor = 1.0;
//     //get bloc from Parent
//     bloc = BlocProvider.of<AuthenticationBloc>(context);
//     controller = AnimationController(
//         duration: const Duration(milliseconds: 3000), vsync: this);
//     animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

//     controller.forward();

//     animation.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         bloc.add(CheckAuth());
//       }
//     });
//   }

//   List<Color> orangeGradients = [
//     ThemeColor.splashScreenColor1(),
//     ThemeColor.splashScreenColor2(),
//     ThemeColor.splashScreenColor3(),
//     ThemeColor.splashScreenColor4(),
//     ThemeColor.splashScreenColor5(),
//     ThemeColor.splashScreenColor6()
//   ];

//   // List<Color> orangeGradients = [
//   //   Color(0xFFbbdefb),
//   //   Color(0xFF90caf9), //#56CCF2
//   //   Color(0xFF64b5f6),
//   //   Color(0xFF42a5f5),
//   //   Color(0xFF2196f3),
//   //   Color(0xFF1e88e5)
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     _curScaleFactor = DisplayUtil.getcurScaleFactor(context);
//     if (MediaQuery.of(context).size.width < 350) {
//       _curScaleFactor = 0.8;
//     }
//     return Scaffold(
//       body: Container(
//           // decoration: new BoxDecoration(
//           //   image: DecorationImage(
//           //     image: AssetImage('images/background1.jpg'),
//           //     fit: BoxFit.cover,
//           //   ),
//           // ),
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: orangeGradients,
//                 begin: Alignment.topLeft,
//                 end: Alignment.center),
//           ),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Stack(
//             children: <Widget>[
//               ShowUp(
//                 child: Center(
//                   child: ShaderMask(
//                     shaderCallback: (Rect bounds) {
//                       return RadialGradient(
//                         center: Alignment.topLeft,
//                         radius: 1.0,
//                         colors: <Color>[
//                           Colors.yellow,
//                           Colors.deepOrange.shade900
//                         ],
//                         tileMode: TileMode.mirror,
//                       ).createShader(bounds);
//                     },
//                     child: Text(
//                       "Wincom Solutions",
//                       style: TextStyle(
//                           fontSize: 30.0 * _curScaleFactor,
//                           color: Theme.of(context).canvasColor,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ),
//                 delay: 500,
//               ),
//               ShowUp(
//                 child: Container(
//                   margin: EdgeInsets.only(
//                       top: (_curScaleFactor > 1) ? 120.0 : 80.0),
//                   child: Center(
//                     child: ShaderMask(
//                       shaderCallback: (Rect bounds) {
//                         return RadialGradient(
//                           center: Alignment.topLeft,
//                           radius: 1.0,
//                           colors: <Color>[Colors.white, Colors.white54],
//                           tileMode: TileMode.mirror,
//                         ).createShader(bounds);
//                       },
//                       child: Text(
//                         "No More Painful Intergration",
//                         style: TextStyle(
//                             fontSize: 16.0 * _curScaleFactor,
//                             color: Theme.of(context).canvasColor,
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   ),
//                 ),
//                 delay: 2000,
//               ),
//             ],
//           )),
//     );
//   }
// }
//  );
//   }
// }
