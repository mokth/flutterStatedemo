import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../blog_page/loading_indicator.dart';
import 'list_view_model.dart';

class ListViewDemoBefore extends StatelessWidget {
  const ListViewDemoBefore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListViewModel>.reactive(
        viewModelBuilder: () => ListViewModel(),
        onModelReady: (model) => model.initModel(),
        builder: (context, model, _) {
          return Scaffold(
              appBar: AppBar(title: const Text("List View Before")),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    listViewHeader(),
                    Expanded(child: listBuilder(model)),
                  ],
                ),
              ));
        });
  }

  Widget listBuilder(ListViewModel model) {
    return ListView.builder(
        itemCount: model.list.length,
        itemBuilder: ((context, index) {
          if (index < 0) {
            return Center(child: LoadingIndicator());
          }
          return listViewItem(model, index);
        }));
  }

  Widget listViewHeader() {
    return Row(
      children: const [
        Expanded(flex: 1, child: Text("Code")),
        Expanded(flex: 2, child: Text("Description"))
      ],
    );
  }

  Widget listViewItem(ListViewModel model, index) {
    var item = model.list[index];
    return Row(
      children: [
        Expanded(flex: 1, child: Text(item.code!)),
        Expanded(flex: 2, child: Text(item.description!))
      ],
    );
  }
}
