/*
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/share/components/components.dart';

import '../../features/layout/presentation/logic/cubit.dart';
import '../../features/layout/presentation/logic/state.dart';
import '../../share/style/const.dart';

class EgyBusinessScreen extends StatelessWidget {
  const EgyBusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = NewsCubit.get(context).egBusiness;

    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: NewsCubit.get(context).isSwitch ? b : w,
          appBar: AppBar(
            title: const Text(
              'أخبار الأعمال المصرية',
              style: TextStyle(color: Colors.black, fontSize: 18.0),
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
                const SizedBox(
                  height: 40.0,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: list.length,
                    itemBuilder: (context, index) =>
                        buildArticlesItem(list[index], context, text: 'تفاصيل'),
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
*/
