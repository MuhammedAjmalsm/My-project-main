import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/favourites.dart';

class noodles extends StatefulWidget {
  const noodles({super.key});

  @override
  State<noodles> createState() => _noodlesState();
}

class _noodlesState extends State<noodles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
       backgroundColor:Color.fromARGB(255, 45, 177, 49),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => favorates()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),

      body: Container(
        
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 45, 177, 49),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(180, 100),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 20.h, // Burger 30 pixels thazhekku varum
              left: 0,
              right: 20,
              child: Align(
                alignment: AlignmentGeometry.topCenter,
                child: Image.asset(
                  fit: BoxFit.fitWidth,
                  'assets/images/Noodles.png',
                  width: 350.w,
                  height: 300.h,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(23),
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 350),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Noodles",
                            style: GoogleFonts.urbanist(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 245, 243, 243),
                            ),
                          ),
                          Text(
                            "Rs 200",
                            style: GoogleFonts.urbanist(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 45, 177, 49),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      children: [
                        Container(
                          
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Text(
                            "Details",
                            style: GoogleFonts.urbanist(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 45, 177, 49),
                            ),
                          ),
                        ),SizedBox(width: 15.w),
                          Container(
                          
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Text(
                            "Review",
                            style: GoogleFonts.urbanist(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 45, 177, 49),
                            ),
                          ),
                        ),
                       

                      ],
                    ), SizedBox(height: 10.w),
                    Text(
                      "Noodles are a type of unleavened dough food made from wheat, rice, or other grains, typically shaped into long, thin strips or cylinders, and cooked in boiling liquid before being tossed with sauces, vegetables, or meat.",
                      style: GoogleFonts.urbanist(
                        color: Colors.white70,
                        fontSize: 13.sp,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 35.h,),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 45, 177, 49),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),onPressed: (){}, child: Text(
                          "Add to Cart",
                          style: GoogleFonts.urbanist(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
