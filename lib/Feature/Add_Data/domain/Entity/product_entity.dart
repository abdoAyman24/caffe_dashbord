
import 'package:caffee_dashbord/Feature/Add_Data/domain/Entity/review_entity.dart';

class ProductEntity {
   String? imageUrl;
  final String productId;
  final String name;
  final String additional;
  final String details;
  final num rate;

  final num priceS;
  final num priceM;
  final num priceL;

  final List<ReviewEntity> reviewEntity;

  ProductEntity({
     this.imageUrl,
    required this.productId,
    required this.name,
    required this.additional,
    required this.details,
     this.rate=0,
    required this.priceS,
    required this.priceM,
    required this.priceL,

     this.reviewEntity=const <ReviewEntity>[],
  });
}
