enum Routes { Category_Detail, Meal_Detail, Filter }

extension RoutesExtension on Routes {
  static const route_list = {
    Routes.Category_Detail: '/categories_detail',
    Routes.Meal_Detail: '/meal_detail',
    Routes.Filter: '/filters'
  };
  String get route => route_list[this];
}
