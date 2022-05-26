import 'package:flutter/cupertino.dart';
import 'package:statedemo/api/api_repo.dart';
import 'package:statedemo/model/reftable.dart';

class ListViewModel extends ChangeNotifier {
  final APIRepository repo = APIRepository();

  RefTable? selected;

  List<RefTable> list = <RefTable>[];

  initModel() async {
    list = await repo.getItemType("AB", "JB");
    notifyListeners();
  }

  Future<List<RefTable>> getListAsync() async {
    return await repo.getItemType("AB", "JB");
  }

  setSelectedItem(RefTable item) {
    selected = item;
    notifyListeners();
  }

  getSelectedItem() {
    return "Selected code: ${selected?.code}";
  }
}
