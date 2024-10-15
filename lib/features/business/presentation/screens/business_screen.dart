import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/business/presentation/logic/business_cubit.dart';
import 'package:news_app/features/business/presentation/logic/business_state.dart';
import 'package:news_app/features/business/presentation/screens/widgets/business_listview.dart';

import '../../../../core/widgets/article_loading_item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCubit, BusinessStates>(
      buildWhen: (previous, current) =>
          State is! Loading || State is Success || State is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return const ArticleLoadingItem();
          },
          error: (error) {
            return Center(child: Text(error));
          },
          loaded: (businessModel) {
            return BusinessListview(
              businessModel: businessModel,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
