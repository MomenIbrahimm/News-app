import 'package:bloc/bloc.dart';
import 'package:news_app/features/search/data/repo/search_repo.dart';
import 'package:news_app/features/search/presentation/logic/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(const SearchStates.initial());

  Future<void> getSearchData({required String text}) async {
    emit(const SearchStates.loading());
    final response = await searchRepo.searchNews(text: text);

    response.when(
      success: (searchModel) {
        emit(
          SearchStates.loaded(searchModel),
        );
      },
      failure: (error) {
        emit(
          SearchStates.error(error.errMessage),
        );
      },
    );
  }
}
