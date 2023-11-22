import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PopularMeals {
  PopularMeals({required this.imgUrl, required this.title}) : id = uuid.v4();
  final String id;
  final String title;
  final String imgUrl;
}
