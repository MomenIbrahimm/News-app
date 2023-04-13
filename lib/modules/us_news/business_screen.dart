import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit.dart';
import 'package:news_app/layout/state.dart';
import 'package:news_app/modules/egy_news/eg_business.dart';
import 'package:news_app/share/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).business;

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BuildCondition(
          condition: state is! GetBusinessDataLoadingState,
          builder: (context) => Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: list.length,
                  itemBuilder: (context, index) =>
                      buildArticlesItem(list[index], context),
                  separatorBuilder: (context, index) => myDivider(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const EgyBusinessScreen()));
                  },
                  color: Colors.blueGrey,
                  child: const Text(
                    'أخبار مصرية',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
