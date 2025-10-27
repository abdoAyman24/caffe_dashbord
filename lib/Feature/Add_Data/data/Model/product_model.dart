import 'package:caffee_dashbord/Feature/Add_Data/data/Model/Review_model.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/Entity/product_entity.dart';

class ProductModel {
  final String imageUrl;
  final String productId;
  final String name;
  final String additional;
  final String details;
  final num rate;

  final num priceS;
  final num priceM;
  final num priceL;
  final List<ReviewModel> reviewModel;

  ProductModel({
    required this.imageUrl,

    required this.productId,
    required this.name,
    required this.additional,
    required this.details,
    required this.rate,

    required this.priceS,
    required this.priceM,
    required this.priceL,
    required this.reviewModel,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      imageUrl: entity.imageUrl!,
      productId: entity.productId,
      name: entity.name,
      additional: entity.additional,
      details: entity.details,
      rate: entity.rate,
      priceS: entity.priceS,
      priceM: entity.priceM,
      priceL: entity.priceL,
      reviewModel: List<ReviewModel>.from(entity.reviewEntity.map((e) {
        ReviewModel.fromEntity(e);
      })),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'productId': productId,
      'name': name,
      'additional': additional,
      'details': details,
      'rate': rate,
      'priceS': priceS,
      'priceM': priceM,
      'priceL': priceL,
      'reviewEntity': reviewModel.map((e) {
        e.toMap();
      }).toList(),
    };
  }
}
