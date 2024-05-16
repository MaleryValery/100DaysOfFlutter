import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals__app/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
