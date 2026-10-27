import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:mynewapp/creatnewaccound.dart';

class singin extends StatefulWidget {
  const singin({super.key});

  @override
  State<singin> createState() => _singinState();
}

class _singinState extends State<singin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 50,),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                
                SizedBox(
                  
                  child: Image.asset('assets/images/unnamed.png', width: 150.w),
                ),
                Text(
                  "Let's you in",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 242, 251, 242),
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 300.w,
                  height: 55.h,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 42, 40, 34),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, size: 30, color: Colors.blue),
                      SizedBox(width: 10),
                      Text(
                        "Continue with facebook",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300.w,
                  height: 55.h,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 42, 40, 34),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.g_mobiledata,
                        size: 30,
                        color: CupertinoColors.systemMint,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Continue with google",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300.w,
                  height: 55.h,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 42, 40, 34),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.apple,
                        size: 30,
                        color: CupertinoColors.extraLightBackgroundGray,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Continue with Apple",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 110,
                        endIndent: 10,
                        color: CupertinoColors.extraLightBackgroundGray,
                      ),
                    ),
                    Text("or", style: TextStyle(color: Colors.white)),
                    Expanded(child: Divider(endIndent: 110, indent: 10)),
                  ],
                ),
          
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>signuppage ()),
                    );
                  },
                  child: Container(
                    width: 300.w,
                    height: 45.h,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 3, 252, 32),
                      borderRadius: BorderRadius.circular(55.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "sign in with Phone number",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
          
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "sign up",
                      style: TextStyle(color: Color.fromARGB(255, 32, 229, 81)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
