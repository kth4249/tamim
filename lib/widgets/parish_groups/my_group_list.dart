import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamim/providers/main_provider.dart';

class MyGroupList extends StatefulWidget {
  const MyGroupList({super.key});

  @override
  State<MyGroupList> createState() => _MyGroupListState();
}

class _MyGroupListState extends State<MyGroupList> {
  @override
  Widget build(BuildContext context) {
    final myGroups = context.watch<MainProvider>().myGroups;
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...myGroups.map((group) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<MainProvider>()
                            .fetchGroupMainInfo(group.id);
                      },
                      child: Card(
                        child: SizedBox(
                          height: constraints.maxHeight * 0.7,
                          width: 100,
                          child: Center(
                            child: Text(group.category.categoryName),
                          ),
                        ),
                      ),
                    ),
                    Text(group.parish.parishName),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
