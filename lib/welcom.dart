import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:mynewapp/relogin.dart';

class welcom extends StatefulWidget {
  const welcom({super.key});

  @override
  State<welcom> createState() => _welcomState();
}

class _welcomState extends State<welcom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(child: Image.asset('assets/images/unnamed.png', width: 150)),

          Text(
            "Order for Food",
            style: TextStyle(
              color: const Color.fromARGB(255, 183, 255, 167),
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et \ndolore magna aliqua.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 50),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: const Color.fromARGB(255, 57, 211, 19),
          //       maximumSize: Size(300, 50),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadiusGeometry.circular(30),
          //       ),
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => page2()),
          //       );
          //     },
          //     child: Text("Next"),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page2()),
              );
            },
            child: Container(
              width: 300.w,
              height: 45.h,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 252, 32),
                borderRadius: BorderRadius.circular(55.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Next", style: TextStyle(color: Colors.white))],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(child: Image.asset('assets/images/unnamed.png', width: 150)),
          Text(
            "Easy Payment",
            style: TextStyle(
              color: Colors.green,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed do eiusmod tempor\n incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 45.h),

          // Padding(
          //   padding: const EdgeInsets.all(30),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: const Color.fromARGB(255, 57, 211, 19),
          //       maximumSize: Size(300, 50),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadiusGeometry.circular(30),
          //       ),
          //     ),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => page3()),
          //       );
          //     },
          //     child: Text("Next"),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page3()),
              );
            },
            child: Container(
              width: 300.w,
              height: 45.h,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 252, 32),
                borderRadius: BorderRadius.circular(55.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Next", style: TextStyle(color: Colors.white))],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(child: Image.asset('assets/images/unnamed.png', width: 150)),
          Text(
            "Fast delivery",
            style: TextStyle(
              color: Colors.green,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor\n incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 45.h),

          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => relogin()),
              );
            },
            child: Container(
              width: 300.w,
              height: 45.h,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 252, 32),
                borderRadius: BorderRadius.circular(55.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Get started", style: TextStyle(color: Colors.white))],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
