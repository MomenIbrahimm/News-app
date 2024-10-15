import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/sports/presentation/logic/sports_states.dart';

import '../../data/repo/sports_repo.dart';

class SportsCubit extends Cubit<SportsStates> {
  final SportsRepo sportsRepo;
  SportsCubit(this.sportsRepo) : super(const SportsStates.initial());

  void getSportsData() async {
    emit(const SportsStates.loading());

    final response = await sportsRepo.getSportsData();

    response.when(success: (sportsModel) {
      emit(SportsStates.loaded(sportsModel));
    }, failure: (failure) {
      emit(SportsStates.error(error: failure.errMessage));
    });
  }
}
