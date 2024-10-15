import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../business/data/model/news_model.dart';

part 'sports_states.freezed.dart';

@freezed
class SportsStates with _$SportsStates {
  const factory SportsStates.initial() = _initial;
  const factory SportsStates.loading() = Loading;
  const factory SportsStates.loaded(NewsModel sportsModel) = Loaded;
  const factory SportsStates.error({required String error}) = Error;
}
