class FavModel{
  bool status;
  String message;
  FavModel({required this.status,required this.message});
  factory FavModel.fromJson(Map<String, dynamic> json) {
    return FavModel(
      status: json['status'],
      message: json['message'],
    );
  }


}