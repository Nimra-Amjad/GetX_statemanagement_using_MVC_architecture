import 'package:flutter/material.dart';
import 'package:getx_statemanagement/controller/shopping_controller.dart';
import 'package:getx_statemanagement/controller/cart_controller.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${controller.products[index].productName}'),
                                      Text(
                                          '${controller.products[index].productDescription}')
                                    ],
                                  ),
                                  Text(
                                    '\$${controller.products[index].price}',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    cartController
                                        .addToCart(controller.products[index]);
                                  },
                                  child: const Text('Add to cart'))
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total amount: \$ ${controller.totalPrice}',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: const Icon(Icons.add_shopping_cart_rounded),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.count.toString(),
              style: TextStyle(color: Colors.black),
            );
          })),
    );
  }
}
