import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/business_model.dart';

part 'business_state.freezed.dart';

@freezed
class BusinessStates<T> with _$BusinessStates<T> {
  const factory BusinessStates.initial() = _Initial;
  const factory BusinessStates.loading() = Loading;
  const factory BusinessStates.loaded(BusinessModel businessModel) = Success;
  const factory BusinessStates.error({required String error}) = Error;
}
