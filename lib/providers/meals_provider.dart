import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals2/models/meal.dart';

import '../data/dummy_data.dart';

final Provider<List<Meal>> mealsProvider = Provider<List<Meal>>((Ref ref) => dummyMeals);
