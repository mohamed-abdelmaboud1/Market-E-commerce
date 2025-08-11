

abstract class BannersState {}

class BannersInitial extends BannersState {}

class BannersLoading extends BannersState {}

class BannersLoaded extends BannersState {
  final  List<String> bannerList;

  BannersLoaded(this.bannerList);
}

class BannersError extends BannersState {
  final String errMessage;

  BannersError(this.errMessage);
}
