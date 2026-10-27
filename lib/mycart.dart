import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/cart_provider.dart';
import 'package:mynewapp/location.dart';
import 'package:provider/provider.dart';




class mycart extends StatefulWidget {
  const mycart({super.key});

  @override
  State<mycart> createState() => _mycartState();
}

class _mycartState extends State<mycart> {
  @override
  Widget build(BuildContext context) {
     final cart = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.arrow_back,
          color: const Color.fromARGB(255, 245, 233, 233),
        ),
        title: Text(
          "My Cart",
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
     body: cart.items.isEmpty
    ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.green,
              size: 70.sp,
            ),

            SizedBox(height: 15.h),

            Text(
              "Your Cart is Empty",
              style: GoogleFonts.urbanist(
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      )
    : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(15.w),
              itemCount: cart.items.length,

              itemBuilder: (context, index) {
                final item = cart.items[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  padding: EdgeInsets.all(12.w),

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 35, 35, 35),
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.green),
                  ),

                  child: Row(
                    children: [
                      // BURGER IMAGE
                      Image.asset(
                        item.image,
                        width: 85.w,
                        height: 85.h,
                        fit: BoxFit.contain,
                      ),

                      SizedBox(width: 10.w),

                      // NAME, PRICE, QUANTITY
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: GoogleFonts.urbanist(
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8.h),

                            Text(
                              "₹${item.price.toStringAsFixed(0)}",
                              style: GoogleFonts.urbanist(
                                color: Colors.green,
                                fontSize: 16.sp,
                              ),
                            ),

                            SizedBox(height: 10.h),

                            Row(
                              children: [
                                // MINUS BUTTON
                                IconButton(
                                  onPressed: () {
                                    cart.decreaseQuantity(item.id);
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.green,
                                  ),
                                ),

                                Text(
                                  "${item.quantity}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),

                                // PLUS BUTTON
                                IconButton(
                                  onPressed: () {
                                    cart.increaseQuantity(item.id);
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // DELETE BUTTON
                      IconButton(
                        onPressed: () {
                          cart.removeItem(item.id);
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final pos = await getCurrentLocation();
                print('${pos.latitude}, ${pos.longitude}');

                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Location: ${pos.latitude}, ${pos.longitude}',
                    ),
                  ),
                );
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Location kittiyilla. Permission allow cheyyuka.'),
                  ),
                );
              }
            },
            child: const Text('Use current location'),
          ),

          // TOTAL AMOUNT
          Container(
            padding: EdgeInsets.all(20.w),
            color: const Color.fromARGB(255, 30, 30, 30),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),

                    Text(
                      "₹${cart.totalPrice.toStringAsFixed(0)}",
                      style: GoogleFonts.urbanist(
                        color: Colors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15.h),

                SizedBox(
                  width: double.infinity,
                  height: 50.h,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),

                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Proceeding to Checkout"),
                        ),
                      );
                    },

                    child: Text(
                      "Checkout",
                      style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        
    );
  }
}
