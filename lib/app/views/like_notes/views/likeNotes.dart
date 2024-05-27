import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/likeNotesModel.dart';
import '../controller/remove_controller.dart';

class likeNotes extends StatelessWidget {
  const likeNotes({super.key});

  @override
  Widget build(BuildContext context) {
    RemoveController controller = Get.put(RemoveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: GetBuilder<RemoveController>(
        builder: (controller) => FutureBuilder(
          future: controller.getMyNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              List<likeMOdel>? data = snapshot.data as List<likeMOdel>?;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(data[index].notes),
                          subtitle: Text(data[index].notetitle),
                          trailing: IconButton(
                            onPressed: () {
                              controller.removeProduct(data[index].notetitle);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
