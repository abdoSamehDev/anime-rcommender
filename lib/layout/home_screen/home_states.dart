abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class HomeScreenLoadingState extends HomeScreenStates {}

class HomeScreenSuccessState extends HomeScreenStates {}

class HomeScreenErrorState extends HomeScreenStates {

  String error;
  HomeScreenErrorState(this.error);
}

class CategoryScreenSuccessState extends HomeScreenStates {}

class CategoryScreenErrorState extends HomeScreenStates {

  String error;
  CategoryScreenErrorState(this.error);
}

class FavouriteScreenSuccessState extends HomeScreenStates {}

class FavouriteScreenState extends HomeScreenStates {}

class FavouriteScreenFalseState extends HomeScreenStates {}

class FavouriteScreenErrorState extends HomeScreenStates {

  String error;
  FavouriteScreenErrorState(this.error);
}

class GetFavouritesLoadingState extends HomeScreenStates {

}

class GetFavouritesSuccessState extends HomeScreenStates {}

class GetFavouritesErrorState extends HomeScreenStates {

  String error;
  GetFavouritesErrorState(this.error);
}

class GetProfileDataLoadingState extends HomeScreenStates {

}

class GetProfileDataSuccessState extends HomeScreenStates {}

class GetProfileDataErrorState extends HomeScreenStates {

  String error;
  GetProfileDataErrorState(this.error);
}

class UpdateProfileDataLoadingState extends HomeScreenStates {

}

class UpdateProfileDataSuccessState extends HomeScreenStates {}

class UpdateProfileDataErrorState extends HomeScreenStates {

  String error;
  UpdateProfileDataErrorState(this.error);
}

// class SearchLoadingState extends HomeScreenStates {}
//
// class SearchSuccessState extends HomeScreenStates {
//   SearchModel? model;
//
//   SearchSuccessState(this.model);
// }
//
// class SearchErrorState extends HomeScreenStates {
//
//   String error;
//   SearchErrorState(this.error);
// }

class HomeScreenChangeBotNavBar extends HomeScreenStates{}