import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:test_prj/constant/textstyles.dart';
import 'package:test_prj/providers/base_items_provider.dart';
import 'package:test_prj/providers/horizontal_items.dart';
import 'package:test_prj/providers/vertical_items.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                ButtonBack(),
                Container(
                  child: Consumer<HorizontalItemsProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Section 1 (${value.itemsCount.toString()})',
                              style: ProjectTextStyle.headerOne,
                            ),
                          ),
                          Container(
                            height: 174,
                            child: ListViewMy(
                              itemsCount: value.itemsCount,
                              textProvider: value,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Flexible(
                  child: Consumer<VerticalItemsProvider>(
                    builder: (context, value, child) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Section 2 (${value.itemsCount.toString()})',
                              style: ProjectTextStyle.headerOne,
                            ),
                          ),
                          Flexible(
                            child: (Container(
                              child: ListViewMy(
                                itemsCount: value.itemsCount,
                                textProvider: value,
                                direction: Axis.vertical,
                              ),
                            )),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(
          CupertinoIcons.multiply,
          size: 28,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class ListViewMy extends StatelessWidget {
  ListViewMy(
      {Key key,
      this.direction,
      this.edgeInsets,
      this.height,
      this.textProvider,
      this.itemsCount})
      : super(key: key);
  Axis direction;
  EdgeInsets edgeInsets;
  double height;
  BaseItemsProvider textProvider;
  int itemsCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: direction,
      itemCount: itemsCount,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.fromLTRB(
            index == 0 && direction == Axis.horizontal ? 20 : 6,
            10,
            6,
            direction == Axis.horizontal ? 12 : 0),
        child: MyCard(
          index: index,
          textProvider: textProvider,
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  MyCard({
    this.index,
    this.textProvider,
    Key key,
  }) : super(key: key);
  int index;
  BaseItemsProvider textProvider;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        height: 150,
        width: 340,
        child: Text(
          textProvider.generateItemAt(index + 1).toString(),
          style: ProjectTextStyle.headerOne,
        ),
      ),
    );
  }
}
