import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/di/dependency_injection.dart';
import 'package:news_app/features/business/data/repo/business_repo.dart';
import 'package:news_app/features/business/presentation/logic/business_cubit.dart';
import 'package:news_app/features/business/presentation/logic/business_state.dart';
import 'package:news_app/share/components/components.dart';

import '../../../../share/style/style.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BusinessCubit(getIt.get<BusinessRepo>())..getBusinessData(),
      child: BlocBuilder<BusinessCubit, BusinessStates>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return ListView.separated(
                itemCount: 3,
                itemBuilder: (context, index) => Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            '',
                            maxLines: 1,
                          )),
                          Spacer(),
                          Text(''),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('',
                                style: aBeeZee,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          SizedBox(
                              width: 80,
                              height: 30.0,
                              child: MaterialButton(
                                elevation: 5.0,
                                color: Colors.blueGrey,
                                onPressed: () {},
                                child: const Text(
                                  "",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => myDivider(),
              );
            },
            error: (error) {
              return Center(child: Text(error));
            },
            loaded: (businessModel) {
              return ListView.separated(
                itemCount: businessModel.articles!.length,
                itemBuilder: (context, index) =>
                    buildArticlesItem(businessModel.articles![index], context),
                separatorBuilder: (context, index) => myDivider(),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
