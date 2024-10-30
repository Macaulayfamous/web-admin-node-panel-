import 'package:flutter/material.dart';
import 'package:web_admin_front_end/controllers/order_controller.dart';
import 'package:web_admin_front_end/models/order_model.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  late Future<List<OrderModel>> futureOrders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureOrders = OrderController().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    Widget orderData(int flex, Widget widget) {
      return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget,
          ),
        ),
      );
    }

    return FutureBuilder(
        future: futureOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error:${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No Banner'),
            );
          } else {
            final orders = snapshot.data!;

            return SizedBox(
              height: 400,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    return Column(
                      children: [
                        Row(
                          children: [
                            orderData(
                              2,
                              Image.network(
                                order.image,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            orderData(
                              3,
                              Text(order.productName),
                            ),
                            orderData(
                              2,
                              Text(
                                '\$${order.productPrice.toStringAsFixed(2)}',
                              ),
                            ),
                            orderData(
                              2,
                              Text(
                                order.category,
                              ),
                            ),
                            orderData(
                              3,
                              Text(
                                order.fullName,
                              ),
                            ),
                            orderData(
                              3,
                              Text(
                                order.email,
                              ),
                            ),
                            orderData(
                              3,
                              Text('${order.city}, ${order.state}'),
                            ),
                            orderData(
                              2,
                              Text(order.delivered == true
                                  ? 'delivered'
                                  : order.processing == true
                                      ? 'processing'
                                      : 'canceled'),
                            ),
                          ],
                        ),
                        Divider(),
                      ],
                    );
                  }),
            );
          }
        });
  }
}
