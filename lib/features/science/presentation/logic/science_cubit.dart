import 'package:bloc/bloc.dart';
import 'package:news_app/features/science/presentation/logic/science_states.dart';

import '../../data/repo/science_repo.dart';

class ScienceCubit extends Cubit<ScienceStates> {
  final ScienceRepo scienceRepo;
  ScienceCubit(this.scienceRepo) : super(const ScienceStates.initial());

  void getScienceData() async {
    emit(const ScienceStates.loading());
    final response = await scienceRepo.getScienceData();

    response.when(
      success: (scienceModel) => emit(
        ScienceStates.loaded(scienceModel),
      ),
      failure: (failure) => emit(
        ScienceStates.error(error: failure.errMessage),
      ),
    );
  }
}
