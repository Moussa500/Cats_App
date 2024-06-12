import 'package:cat_app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final CatController catController = Get.put(CatController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => catController.getCatImages(),
          backgroundColor: Colors.purple,
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            const Center(
                child: Text(
              "Random Cat Images",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),
            Obx(() {
              if (catController.images.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Map catImage = catController.images[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(catImage["url"]),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 15,
                            ),
                        itemCount: catController.images.length));
              }
            }),
          ],
        ),
      ),
    );
  }
}
