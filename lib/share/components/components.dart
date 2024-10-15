import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:news_app/share/style/style.dart';

int currentIndex = 1;

Widget defaultTab({required IconData icon, required String text}) {
  return Tab(icon: Icon(icon), text: text, height: 70);
}

Widget switchTab() {
  return // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
      FlutterToggleTab(
    borderRadius: 7.5,
    width: 60,
    height: 30,
    selectedIndex: currentIndex,
    selectedBackgroundColors: const [Colors.blueGrey, Colors.blueGrey],
    selectedTextStyle: const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
    unSelectedTextStyle: const TextStyle(
        color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
    labels: const ['Us News'],
    selectedLabelIndex: (index) {
      currentIndex = index;
      print(index);
    },
    isScroll: false,
  );
}

Widget defaultText(text) {
  return Text(text, style: aBeeZee);
}

Widget defaultSizedBox() {
  return const SizedBox(
    height: 10,
  );
}

Widget myDivider() {
  return const Divider();
}
