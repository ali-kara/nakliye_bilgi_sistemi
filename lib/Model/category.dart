class Category {
  final int categoryId;
  final String categoryName;
  final String? description;
  final dynamic menuItems;

  Category(
      this.categoryId, this.categoryName, this.description, this.menuItems);

  // factory Category.fromJson(Map<String, dynamic> json) {
  //   return Category(
  //     categoryId: json['categoryId'],
  //     categoryName: json['categoryName'],
  //     description: json['description'],
  //   );
  // }
}
