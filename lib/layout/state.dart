abstract class NewsState {}

class InitialState extends NewsState{}

class SwitchState extends NewsState{}

class TogleState extends NewsState{}

class ChangeBottomNav extends NewsState{}


class GetBusinessDataLoadingState extends NewsState{}

class GetBusinessDataSuccessState extends NewsState{}

class GetBusinessDataErrorState extends NewsState{
  final String error;

  GetBusinessDataErrorState(this.error);
}
//EGY
class GetEgyBusinessDataLoadingState extends NewsState{}

class GetEgyBusinessDataSuccessState extends NewsState{}

class GetEgyBusinessDataErrorState extends NewsState{
  final String error;

  GetEgyBusinessDataErrorState(this.error);
}
//Business

class GetSportsDataLoadingState extends NewsState{}

class GetSportsDataSuccessState extends NewsState{}

class GetSportsDataErrorState extends NewsState{
  final String error;

  GetSportsDataErrorState(this.error);
}

class GetEgySportsDataLoadingState extends NewsState{}

class GetEgySportsDataSuccessState extends NewsState{}

class GetEgySportsDataErrorState extends NewsState{
  final String error;

  GetEgySportsDataErrorState(this.error);
}
//EGY

class GetScienceDataLoadingState extends NewsState{}

class GetScienceDataSuccessState extends NewsState{}

class GetScienceDataErrorState extends NewsState{
  final String error;

  GetScienceDataErrorState(this.error);
}

class GetEgyScienceDataLoadingState extends NewsState{}

class GetEgyScienceDataSuccessState extends NewsState{}

class GetEgyScienceDataErrorState extends NewsState{
  final String error;

  GetEgyScienceDataErrorState(this.error);
}

class GetSearchDataLoadingState extends NewsState{}

class GetSearchDataSuccessState extends NewsState{}

class GetSearchDataErrorState extends NewsState{
  final String error;

  GetSearchDataErrorState(this.error);
}


