import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/layout/cubit.dart';
import 'package:news_app/layout/state.dart';
import 'package:news_app/share/components/components.dart';
import '../share/style/const.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                onChanged: (value) {
                  NewsCubit.get(context).getSearchData(value: value);
                },
                style: TextStyle(fontSize:14.0,color: b) ,
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: NewsCubit.get(context).isSwitch?Colors.blueGrey:b),
                    filled: true,
                    fillColor: w,
                    suffixIcon: Icon(Ionicons.search_outline,color:NewsCubit.get(context).isSwitch?Colors.blueGrey:b ,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.5),
                    )),
              ),
              const SizedBox(height: 5.0,),
              Expanded(
                  child: BuildCondition(
                condition: state is! GetSearchDataLoadingState,
                builder: (context) => ListView.separated(
                    itemBuilder: (context, index) =>
                        buildArticlesItem(list[index],context),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: list.length),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ))
            ],
          ),
        );
      },
    );
  }
}
// Column(
// children: [
// Padding(
// padding: const EdgeInsets.all(16.0),
// child: TextFormField(
// controller: searchController,
// keyboardType: TextInputType.text,
// decoration: InputDecoration(
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(
// color: Theme.of(context).primaryColor,
// ),
// borderRadius: BorderRadius.circular(15.0)),
// label: const Text('search'),
// hintText: 'search',
// filled: true,
// fillColor: Colors.blueGrey[100],
// suffixIcon: const Icon(Ionicons.search_outline),
// iconColor: Theme.of(context).primaryColor),
// // onFieldSubmitted: (String value) {
// //   if (formKey.currentState!.validate()) {
// //
// //   }
// // },
// onChanged: (value) {
// NewsCubit().getSearchData(value: value);
// },
// validator: (String? value) {
// if (value!.isEmpty) {
// return 'field search is empty';
// }
// return null;
// },
// ),
// ),
// Expanded(
// child: BuildCondition(
// condition: state is! GetSearchDataLoadingState,
// builder: (context) => ListView.separated(
// itemBuilder: (context, index) =>
// (buildArticlesItem(list[index], context)),
// separatorBuilder: (context, index) => myDivider(),
// itemCount: list.length),
// fallback: (context) =>
// const Center(child: CircularProgressIndicator()),
// ),
// )
// ],
// );
