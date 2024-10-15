import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

part 'search_states.freezed.dart';

@freezed
class SearchStates with _$SearchStates {
  const factory SearchStates.initial() = _Initial;
  const factory SearchStates.loading() = Loading;
  const factory SearchStates.loaded(NewsModel searchModel) = Loaded;
  const factory SearchStates.error(String error) = Error;
}
