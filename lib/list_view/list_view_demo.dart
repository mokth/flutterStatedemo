import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../blog_page/loading_indicator.dart';
import 'list_view_model.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListViewModel>.reactive(
        viewModelBuilder: () => ListViewModel(),
        onModelReady: (model) => model.initModel(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(title: const Text("List View Builder")),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  listViewHeader(context),
                  Expanded(child: listBuilder(context, model)),
                ],
              ),
            ),
            bottomSheet: bottomSheet(context, model),
          );
        });
  }

  Widget bottomSheet(BuildContext context, ListViewModel model) {
    return Container(
      height: 40,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
          child: Text(model.getSelectedItem(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700))),
    );
  }

  Widget listBuilder(BuildContext context, ListViewModel model) {
    return ListView.builder(
        itemCount: model.list.length,
        itemBuilder: ((context, index) {
          if (index < 0) {
            return Center(child: LoadingIndicator());
          }
          return listViewItem(context, model, index);
        }));
  }

  Widget listViewHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                "Code".toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              )),
          Expanded(
              flex: 2,
              child: Text("Description".toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700)))
        ],
      ),
    );
  }

  Widget listViewItem(BuildContext context, ListViewModel model, index) {
    var item = model.list[index];
    return InkWell(
      onTap: () {
        model.setSelectedItem(item);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(0, 3, 0, 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).primaryColorLight),
        child: Row(
          children: [
            Expanded(flex: 1, child: Text(item.code!)),
            Expanded(flex: 2, child: Text(item.description!))
          ],
        ),
      ),
    );
  }
}
