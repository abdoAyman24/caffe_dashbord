import 'package:caffee_dashbord/Feature/Add_Data/domain/Entity/review_entity.dart';

class ReviewModel {
  final String name;
  final String date;
  final String description;
  final num rate;

  ReviewModel({
    required this.name,
    required this.date,
    required this.description,
    required this.rate,
  });

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      date: date,
      description: description,
      rate: rate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'data': date,
      'description': description,
      'rate': rate,
    };
  }

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      date: entity.date,
      description: entity.description,
      rate: entity.rate,
    );
  }
}
