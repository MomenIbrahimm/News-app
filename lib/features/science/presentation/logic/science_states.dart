import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/features/business/data/model/news_model.dart';

part 'science_states.freezed.dart';

@freezed
class ScienceStates with _$ScienceStates {
  const factory ScienceStates.initial() = _Initial;

  const factory ScienceStates.loading() = Loading;

  const factory ScienceStates.loaded(NewsModel scienceModel) = Loaded;

  const factory ScienceStates.error({required String error}) = Error;
}
