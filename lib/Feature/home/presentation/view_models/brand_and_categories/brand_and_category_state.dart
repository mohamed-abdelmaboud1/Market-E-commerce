import 'package:marketi_ecommers/Feature/home/data/models/brand_or_categories_model.dart';

abstract class BrandAndCategoryState {}

class BrandAndCategoryInitial extends BrandAndCategoryState {}

class BrandAndCategoryLoading extends BrandAndCategoryState {}

class BrandAndCategoryLoaded extends BrandAndCategoryState {
  final List<BrandOrCategoriesModel> products;

  BrandAndCategoryLoaded(this.products);
}

class BrandAndCategoryError extends BrandAndCategoryState {
  final String errMessage;

  BrandAndCategoryError(this.errMessage);
}
