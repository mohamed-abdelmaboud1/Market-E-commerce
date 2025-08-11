class TopSearchModel {
  final String id;
  final String data;
  final int number;

  TopSearchModel({required this.id, required this.data, required this.number});

  factory TopSearchModel.fromJson(Map<String, dynamic> json) {
    return TopSearchModel(
        id: json['_id'], data: json['data'], number: json['number']);
  }
}
