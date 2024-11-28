class CategoriesModel {
  final String categoryName;
  final String categoryImage;
  final String categoryId;

  CategoriesModel({
    required this.categoryName,
    required this.categoryImage,
    required this.categoryId,
  });

  // Factory constructor to create a CategoriesModel from JSON
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoryName: json["categoryName"],
      categoryImage: json["categoryImage"],
      categoryId: json["categoryId"],
    );
  }
}
