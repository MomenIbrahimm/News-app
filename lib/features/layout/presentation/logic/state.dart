abstract class AppState {}

class InitialState extends AppState {}

class SwitchState extends AppState {}

class TogleState extends AppState {}

class ChangeBottomNav extends AppState {}

class GetBusinessDataLoadingState extends AppState {}

class GetBusinessDataSuccessState extends AppState {}

class GetBusinessDataErrorState extends AppState {
  final String error;

  GetBusinessDataErrorState(this.error);
}

//EGY
class GetEgyBusinessDataLoadingState extends AppState {}

class GetEgyBusinessDataSuccessState extends AppState {}

class GetEgyBusinessDataErrorState extends AppState {
  final String error;

  GetEgyBusinessDataErrorState(this.error);
}
//Business

class GetSportsDataLoadingState extends AppState {}

class GetSportsDataSuccessState extends AppState {}

class GetSportsDataErrorState extends AppState {
  final String error;

  GetSportsDataErrorState(this.error);
}

class GetEgySportsDataLoadingState extends AppState {}

class GetEgySportsDataSuccessState extends AppState {}

class GetEgySportsDataErrorState extends AppState {
  final String error;

  GetEgySportsDataErrorState(this.error);
}
//EGY

class GetScienceDataLoadingState extends AppState {}

class GetScienceDataSuccessState extends AppState {}

class GetScienceDataErrorState extends AppState {
  final String error;

  GetScienceDataErrorState(this.error);
}

class GetEgyScienceDataLoadingState extends AppState {}

class GetEgyScienceDataSuccessState extends AppState {}

class GetEgyScienceDataErrorState extends AppState {
  final String error;

  GetEgyScienceDataErrorState(this.error);
}

class GetSearchDataLoadingState extends AppState {}

class GetSearchDataSuccessState extends AppState {}

class GetSearchDataErrorState extends AppState {
  final String error;

  GetSearchDataErrorState(this.error);
}
