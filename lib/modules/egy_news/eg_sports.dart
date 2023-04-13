import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit.dart';
import 'package:news_app/layout/state.dart';
import 'package:news_app/share/components/components.dart';

import '../../share/style/const.dart';

class EgySportsScreen extends StatelessWidget {
  const EgySportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).egySports;

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: NewsCubit.get(context).isSwitch ? b : w,
          appBar: AppBar(
            title: const Text(
              'اخبار رياضية مصرية',
              style: TextStyle(color: Colors.white,fontSize: 18.0),
            ),
            backgroundColor: NewsCubit.get(context).isSwitch ? b : w,
            iconTheme: NewsCubit.get(context).isSwitch
                ? const IconThemeData(
                    color: Colors.white,
                  )
                : const IconThemeData(
                    color: Colors.black,
                  ),
            elevation: 0.0,
          ),
          body: BuildCondition(
            condition: state is! GetBusinessDataLoadingState,
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40.0,),
                Expanded(
                  child: ListView.separated(
                    itemCount: list.length,
                    itemBuilder: (context, index) =>
                        buildArticlesItem(list[index], context),
                    separatorBuilder: (context, index) => myDivider(),
                  ),
                ),
              ],
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
