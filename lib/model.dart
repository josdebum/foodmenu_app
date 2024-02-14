class FoodModel {
  String? name;
  String? image;
  bool? favourite;
  String? category;

  FoodModel(
      {this.name,
        this.image,
        this.favourite,
        this.category,
        });

  FoodModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    favourite = json['favourite'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['name'] = name;
    response['image'] = image;
    response['favourite'] = favourite;
    response['category'] = category;
    return response;
  }
}
