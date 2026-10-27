import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Notification.dart';
import 'package:mynewapp/Orders(tapbar).dart';
import 'package:mynewapp/dataprofile.dart';
import 'package:mynewapp/favourites.dart';
import 'package:mynewapp/message(tapbar).dart';
import 'package:mynewapp/mycart.dart';
import 'package:mynewapp/subpages/burger.dart';
import 'package:mynewapp/subpages/dosha.dart';
import 'package:mynewapp/subpages/laddu.dart';
import 'package:mynewapp/subpages/noodles.dart';
import 'package:mynewapp/subpages/pizza.dart';
import 'package:mynewapp/subpages/salad.dart';
import 'package:mynewapp/subpages/usa.dart';

class mainhome extends StatefulWidget {
  const mainhome({super.key});

  @override
  State<mainhome> createState() => _mainhomeState();
}

class _mainhomeState extends State<mainhome> {
  // നിങ്ങളുടെ ക്ലാസിനുള്ളിൽ (State ഉള്ളിൽ) ഒരു വേരിയബിൾ വെക്കുക:
bool isFavorite = false;
  // ignore: unused_field
  int _currentIntex = 0;

  final List<Widget> _pages = [
    const Center(
      child: Text("Home", style: TextStyle(color: Colors.white)),
    ),
    const orderstapbar(),
    const message(),
    const mycart(),
    const dataprofile(),
  ];

  final List<Map<String, dynamic>> categories = [
  {'name': 'All', 'icon': Icons.fastfood_outlined},
  {'name': 'Hamburger', 'icon': Icons.lunch_dining},
  {'name': 'Pizza', 'icon': Icons.local_pizza},
  {'name': 'Noodles', 'icon': Icons.ramen_dining},
  {'name': 'Meat', 'icon': Icons.kebab_dining},
  {'name': 'Drinks', 'icon': Icons.local_bar},
  {'name': 'Dessert', 'icon': Icons.cake},
];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.list_alt_outlined, size: 30),
      Icon(Icons.message, size: 30),
      Icon(Icons.shopping_cart, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _currentIntex == 0
          ? AppBar(
              backgroundColor: Colors.black,
              leading: Padding(
                padding: const EdgeInsets.all(8),

                child: CircleAvatar(
                  radius: 11.r,
                  foregroundImage: NetworkImage(
                    "https://png.pngtree.com/png-clipart/20230927/original/pngtree-man-avatar-image-for-profile-png-image_13001877.png",
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deliver to",
                    style: TextStyle(color: Colors.white, fontSize: 11.sp),
                  ),
                  Text(
                    "Times Square",
                    style: TextStyle(color: Colors.white, fontSize: 17.sp),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => favorates()),
                    );
                  },
                  icon: Icon(Icons.favorite_outline),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => notification()),
                    );
                  },
                  icon: Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => mycart()),
                    );
                  },
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ],
            )
          : null,
      // body:
      body: _currentIntex == 0
          ? ListView(
              padding: EdgeInsets.all(18.w),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search here...",
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 52, 53, 51),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Special Offers",
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.5),
                      child:   InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => burger())),
                        );
                      },
                        child: Container(
                          height: 150.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 43, 230, 49),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        "30%",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 45.sp,
                                          color: CupertinoColors
                                              .secondarySystemGroupedBackground,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "    DISCOUNT ONLY\n   VALID FOR TODAY!                     ",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.urbanist(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                fit: BoxFit.cover,
                                'assets/images/burger.png',
                                width: 150.w,
                                height: 200.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 70.h,
                              child: Image.asset(
                                fit: BoxFit.contain,
                                'assets/images/burger.png',
                                width: 50.h,
                                height: 40.w,
                              ),
                            ),
                            Text(
                              "Hambure...",
                              style: GoogleFonts.urbanist(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              child: Image.asset(
                                fit: BoxFit.contain,
                                'assets/images/pizza.png',
                                width: 50.w,
                                height: 40.h,
                              ),
                            ),
                            Text(
                              "Pizza",
                              style: GoogleFonts.urbanist(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              child: Image.asset(
                                fit: BoxFit.contain,
                                'assets/images/bbbnoodls.png',
                                width: 50.w,
                                height: 40.h,
                              ),
                            ),
                            Text(
                              "Noodles",
                              style: GoogleFonts.urbanist(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              child: Image.asset(
                                fit: BoxFit.contain,
                                'assets/images/meat.png',
                                width: 50.w,
                                height: 40.h,
                              ),
                            ),
                            Text(
                              "Meat",
                              style: GoogleFonts.urbanist(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              child: Image.asset(
                                fit: BoxFit.contain,
                                'assets/images/vegitables.png',
                                width: 50.w,
                                height: 40.h,
                              ),
                            ),
                            Text(
                              "Vegeta..",
                              style: GoogleFonts.urbanist(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              child: Image.asset(
                                fit: BoxFit.contain,
                                'assets/images/dessert.png',
                                width: 50.w,
                                height: 40.h,
                              ),
                            ),
                            Text(
                              "Dessert",
                              style: GoogleFonts.urbanist(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              child: Image.asset(
                                fit: BoxFit.contain,
                                'assets/images/drinks.png',
                                width: 50.w,
                                height: 40.h,
                              ),
                            ),
                            Text(
                              "Drinks",
                              style: GoogleFonts.urbanist(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 60.h,
                              child: Image.asset(
                                fit: BoxFit.contain,
                                'assets/images/pizza.png',
                                width: 50.w,
                                height: 40.h,
                              ),
                            ),
                            Text(
                              "More",
                              style: GoogleFonts.urbanist(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discound Guaranteed!",
                            style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "See All",
                            style: GoogleFonts.urbanist(
                              color: const Color.fromARGB(255, 14, 233, 14),
                            ),
                          ),
                        ],
                      ),
                    ),



                    ////LEFT SLIDE FOOD ITEMS 
                  
                       SingleChildScrollView(scrollDirection: Axis.horizontal,
                         child: Row(
                           children: [
                            InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => salad())),
                        );
                      },
                         child:     Container(
                              height: 220.h,
                              width: 170.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: const Color.fromARGB(255, 52, 47, 46),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 130.h,
                                      width: 130.w,
                                                   
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.r),
                                                   
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:AssetImage('assets/images/slad og.png')
                                        ),
                                        color: const Color.fromARGB(255, 44, 41, 30),
                                      ),
                                    ),
                                    Text(
                                      "Mixed Salad Bond",
                                      style: GoogleFonts.urbanist(
                                        color: const Color.fromARGB(255, 243, 246, 243),
                                      ),
                                    ),
                                    Text(
                                      "1.5 km |* 4.8(1.2k)",
                                      style: GoogleFonts.urbanist(
                                        color: const Color.fromARGB(255, 243, 246, 243),
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹180",
                                          style: GoogleFonts.urbanist(
                                            color: const Color.fromARGB(
                                              255,
                                              243,
                                              246,
                                              243,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(Icons.favorite_outline),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                                                   ),),SizedBox(width: 19.w,),

                             Container(
                              height: 220.h,
                              width: 170.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: const Color.fromARGB(255, 52, 47, 46),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                     InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => laddu())),
                        );
                      },
                                      child: Container(
                                        height: 130.h,
                                        width: 130.w,
                                                     
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.r),
                                                     
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/images/laddu .png'),
                                          ),
                                          color: const Color.fromARGB(255, 44, 41, 30),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Laddu",
                                      style: GoogleFonts.urbanist(
                                        color: const Color.fromARGB(255, 243, 246, 243),
                                      ),
                                    ),
                                    Text(
                                      "800 m |* 4.8(1.8k)",
                                      style: GoogleFonts.urbanist(
                                        color: const Color.fromARGB(255, 243, 246, 243),
                                        fontSize: 8.sp,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "₹130.00",
                                          style: GoogleFonts.urbanist(
                                            color: const Color.fromARGB(
                                              255,
                                              243,
                                              246,
                                              243,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(Icons.favorite_outline),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),   SizedBox(width: 19.w,),
                             InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => usa())),
                        );
                      },
                              child: Container(
                                height: 220.h,
                                width: 170.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: const Color.fromARGB(255, 52, 47, 46),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 130.h,
                                        width: 130.w,
                                                     
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.r),
                                                     
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage('assets/images/usa.png')
                                          ),
                                          color: const Color.fromARGB(255, 44, 41, 30),
                                        ),
                                      ),
                                      Text(
                                        "Gulab",
                                        style: GoogleFonts.urbanist(
                                          color: const Color.fromARGB(255, 243, 246, 243),
                                        ),
                                      ),
                                      Text(
                                        "2,3 km |* 4.8(1.2k)",
                                        style: GoogleFonts.urbanist(
                                          color: const Color.fromARGB(255, 243, 246, 243),
                                          fontSize: 8.sp,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "₹170",
                                            style: GoogleFonts.urbanist(
                                              color: const Color.fromARGB(
                                                255,
                                                243,
                                                246,
                                                243,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(Icons.favorite_outline),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                                      ),
                            ), SizedBox(width: 19.w,),  
                         InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => dosha())),
                        );
                      },
                          child: Container(
                                height: 220.h,
                                width: 170.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: const Color.fromARGB(255, 52, 47, 46),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 130.h,
                                        width: 130.w,
                                                     
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.r),
                                                     
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:AssetImage('assets/images/dosha.png')
                                          ),
                                          color: const Color.fromARGB(255, 44, 41, 30),
                                        ),
                                      ),
                                      Text(
                                        "Mixed Salad Bond",
                                        style: GoogleFonts.urbanist(
                                          color: const Color.fromARGB(255, 243, 246, 243),
                                        ),
                                      ),
                                      Text(
                                        "1.5 km |* 4.8(1.2k)",
                                        style: GoogleFonts.urbanist(
                                          color: const Color.fromARGB(255, 243, 246, 243),
                                          fontSize: 8.sp,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "₹70",
                                            style: GoogleFonts.urbanist(
                                              color: const Color.fromARGB(
                                                255,
                                                243,
                                                246,
                                                243,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(Icons.favorite_outline),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                          ),
                        ),                   
                           ],
                         ),
                       ),]
                    ),

                    //ALL,Hamburger,pizza,.......
                    Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: SizedBox(
    height: 48.h, // ഹൈറ്റ് അല്പം കൂട്ടി നൽകുക
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length, // നിങ്ങളുടെ കാറ്റഗറി ഡാറ്റ ലിസ്റ്റ്
      separatorBuilder: (context, index) => SizedBox(width: 8.w),
      itemBuilder: (context, index) {
        final category = categories[index];
        return Chip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          labelPadding: EdgeInsets.only(left: 4.w),
          label: Text(
            category['name'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 10, 11, 9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          side: const BorderSide(color: Colors.green),
          avatar: Icon(
            category['icon'],
            color: Colors.green,
            size: 18.sp,
          ),
        );
      },
    ),
  ),
),
                   

                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => burger())),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 115.h,
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 32, 33, 35),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12.r),
                              child: Image.asset(
                                'assets/images/burger.png',
                                width: 80.w,
                                height: 80.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Burger hut",
                                    style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "1.2 km |*4.5(1.9k)",
                                    style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.delivery_dining,
                                        color: const Color.fromARGB(
                                          255,
                                          52,
                                          249,
                                          17,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),

                                     Text(
                                          "₹240",
                                          style: GoogleFonts.urbanist(
                                            color: const Color.fromARGB(
                                              255,
                                              243,
                                              246,
                                              243,
                                            ),
                                          ),
                                        ),
                                      const Spacer(),
                                      Icon(
                                        Icons.favorite_outline,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => pizza())),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 115.h,
                        margin: EdgeInsets.only(bottom: 16.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 32, 33, 35),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12.r),
                              child: Image.network(
                                "https://www.superhealthykids.com/wp-content/uploads/2021/10/best-veggie-pizza-featured-image-square-2.jpg",
                                width: 80.w,
                                height: 80.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pizza Hut -Lumintu",
                                    style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "800 m |*4.9(2.3k)",
                                    style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.delivery_dining,
                                        color: const Color.fromARGB(
                                          255,
                                          52,
                                          249,
                                          17,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                     Text(
                                          "₹300",
                                          style: GoogleFonts.urbanist(
                                            color: const Color.fromARGB(
                                              255,
                                              243,
                                              246,
                                              243,
                                            ),
                                          ),
                                        ),
                                      Spacer(),
                                      Icon(
                                        Icons.favorite_outline,
                                        color: const Color.fromARGB(
                                          255,
                                          239,
                                          11,
                                          11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => noodles())),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 115.h,
                        margin: EdgeInsets.only(bottom: 16.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 32, 33, 35),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12.r),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWjiGUvoTxQJYxl9FnhWEuD1pAT0PkrI_4ca2awGyu_w&s=10",
                                width: 80.w,
                                height: 80.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vegetarian Noodles",
                                    style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "1.7 km |*4.6(4.9k)",
                                    style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.delivery_dining,
                                        color: const Color.fromARGB(
                                          255,
                                          52,
                                          249,
                                          17,
                                        ),
                                      ),
                                      Text(
                                          "₹200",
                                          style: GoogleFonts.urbanist(
                                            color: const Color.fromARGB(
                                              255,
                                              243,
                                              246,
                                              243,
                                            ),
                                          ),
                                        ),
                                      Spacer(),
                                      Icon(
                                        Icons.favorite_outline,
                                        color: const Color.fromARGB(
                                          255,
                                          239,
                                          11,
                                          11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => salad())),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 115.h,
                        margin: EdgeInsets.only(bottom: 16.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 32, 33, 35),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(12.r),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5tfrBlYxnPexSxvBmsXBEQ1ZVK6wEALYvIJKR8XHE_A&s=10",
                                width: 80.w,
                                height: 80.h,
                                fit: BoxFit.cover,
                              ),
                              // child: Image.asset(
                              //   'assets/images/burger.png',
                              //   width: 80,
                              //   height: 80,
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Fruit Salad-Kumpa",
                                    style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "2.6 km |*4.5(1.9k)",
                                    style: GoogleFonts.urbanist(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.delivery_dining,
                                        color: const Color.fromARGB(
                                          255,
                                          52,
                                          249,
                                          17,
                                        ),
                                      ),
                                      Text(
                                          "₹180",
                                          style: GoogleFonts.urbanist(
                                            color: const Color.fromARGB(
                                              255,
                                              243,
                                              246,
                                              243,
                                            ),
                                          ),
                                        ),
                                      Spacer(),
                                      Icon(
                                        Icons.favorite_outline,
                                        color: const Color.fromARGB(
                                          255,
                                          239,
                                          11,
                                          11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ):
              
            
           _pages[_currentIntex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIntex,
        height: 70,
        color: Color(0xFF1E1E1E),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xFF00E676),

        items: items,
        onTap: (index) {
          setState(() {
            _currentIntex = index;
          });
        },
      ),
    );
  }
}
