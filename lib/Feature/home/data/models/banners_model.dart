class BannersModel {
   final  List<String> bannerList;
  
  BannersModel({required this.bannerList});

  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
        bannerList: List<String>.from(json['list']), );
  }
}
