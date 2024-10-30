import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_admin_front_end/views/sidebar_screens/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  static const String id = 'orderscreen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget rowHeader(int flex, String text) {
      return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF3C55EF),
            border: Border.all(
              color: Colors.grey.shade700,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Mannage Orders',
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                rowHeader(2, 'Image'),
                rowHeader(3, 'Product Name '),
                rowHeader(2, 'Price '),
                rowHeader(2, 'Category '),
                rowHeader(3, 'Buyer Name'),
                rowHeader(3, 'Email'),
                rowHeader(3, 'Address'),
                rowHeader(2, 'Status'),
              ],
            ),
            OrderWidget(),
          ],
        ),
      ),
    );
  }
}
