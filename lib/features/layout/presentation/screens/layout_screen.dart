import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/share/components/components.dart';
import 'package:news_app/share/style/style.dart';

import '../../../../share/style/const.dart';
import '../logic/cubit.dart';
import '../logic/state.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultTabController(
          length: NewsCubit.get(context).screens.length,
          child: Scaffold(
            backgroundColor: NewsCubit.get(context).isSwitch ? b : w,
            appBar: AppBar(
              actions: [
                Switch(
                    inactiveThumbColor: w,
                    activeColor: b,
                    value: NewsCubit.get(context).isSwitch,
                    onChanged: (value) {
                      NewsCubit.get(context).switchButton();
                    }),
              ],
              title: Container(
                  color: Colors.black12,
                  child: Text(
                    'News all over the world',
                    style: TextStyle(fontSize: size),
                  )),
              bottom: TabBar(tabs: [
                defaultTab(icon: Ionicons.business, text: 'Business'),
                defaultTab(icon: Ionicons.body, text: 'Sports'),
                defaultTab(icon: Ionicons.thermometer, text: 'Science'),
                defaultTab(icon: Ionicons.search, text: 'Search'),
              ]),
            ),
            body: TabBarView(
              children: NewsCubit.get(context).screens,
            ),
          ),
        );
      },
    );
  }
}
