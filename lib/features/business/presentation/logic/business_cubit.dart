import 'package:bloc/bloc.dart';
import 'package:news_app/features/business/data/repo/business_repo.dart';
import 'package:news_app/features/business/presentation/logic/business_state.dart';

class BusinessCubit extends Cubit<BusinessStates> {
  final BusinessRepo businessRepo;
  BusinessCubit(this.businessRepo) : super(const BusinessStates.initial());

  void getBusinessData() async {
    emit(const BusinessStates.loading());

    final result = await businessRepo.getBusinessData();
    result.when(
      success: (businessModel) {
        emit(BusinessStates.loaded(businessModel));
      },
      failure: (error) {
        emit(BusinessStates.error(error: error.errMessage));
      },
    );
  }
}
