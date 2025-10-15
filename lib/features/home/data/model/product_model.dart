import 'dart:convert';

class ProductModel {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  int itemCount;
  RatingModel? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.itemCount=0,
    this.rating,
  });
    ProductModel copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    int? itemCount,
    RatingModel? rating,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      itemCount: itemCount ?? this.itemCount,
      rating: rating ?? this.rating,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    RatingModel? ratingModel;

    if (json['rating'] != null) {
      if (json['rating'] is String) {
        // For local data read
        ratingModel = RatingModel.fromJson(jsonDecode(json['rating']));
      } else if (json['rating'] is Map) {
        // For remote data read
        ratingModel = RatingModel.fromJson(Map<String, dynamic>.from(json['rating']));
      }
    }

    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'] ?? 0.0,
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
       itemCount: json['itemCount'] ?? 0,
      rating: ratingModel,
    );
  }


  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      //to save rating as string for local cache
      data['rating'] = jsonEncode(rating!.toJson());
    }
    return data;
  }
}

class RatingModel {
  num? rate;
  num? count;

  RatingModel({this.rate, this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
