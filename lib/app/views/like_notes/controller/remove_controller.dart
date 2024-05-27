import 'package:get/get.dart';

import '../../../model/likeNotesModel.dart';
import '../../../utilies/DBhelper/DBhelper.dart';

class RemoveController extends GetxController {
  Future<List<likeMOdel>?> getMyNotes() async {
    List<likeMOdel>? myCart = await DBHelper.dbHelper.getMyNotes();
    return myCart;
  }

  Future<int>? removeProduct(String name) {
    DBHelper.dbHelper.deleteNotes(title: name);
    update();
    return null;
  }
}
