import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class favorates extends StatefulWidget {
  const favorates({super.key});

  @override
  State<favorates> createState() => _favoratesState();
}

class _favoratesState extends State<favorates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
  Navigator.pop(context);
}, icon:Icon(Icons.arrow_back)),
        title: Text(
          "Favorates",
          style: GoogleFonts.urbanist(
            color: const Color.fromARGB(255, 242, 245, 242),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              Icons.more_horiz,
              color: const Color.fromARGB(240, 242, 238, 238),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Empty",
              style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 242, 245, 242),
                fontSize: 15.sp,
              ),
            ),
            Text(
              "You dont have any food in cart at this time",
              style: GoogleFonts.urbanist(
                color: const Color.fromARGB(255, 242, 245, 242),
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}