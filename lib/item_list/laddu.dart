import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/favourites.dart';

class laddu extends StatefulWidget {
  const laddu({super.key});

  @override
  State<laddu> createState() => _ladduState();
}

class _ladduState extends State<laddu> {
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
              right: 0,
              child: Align(
                alignment: AlignmentGeometry.topCenter,
                child: Image.asset(
                  fit: BoxFit.fitWidth,
                  'assets/images/laddu .png',
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
                            "Laddu",
                            style: GoogleFonts.urbanist(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 245, 243, 243),
                            ),
                          ),
                          Text(
                            "Rs 130",
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
                        ),
                        SizedBox(width: 15.w),
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
                      "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
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
