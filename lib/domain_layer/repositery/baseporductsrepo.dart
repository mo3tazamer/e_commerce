import '../entites/products/products.dart';

abstract class BaseGetProductsRepo{

  Future<List<Products>> getProduct();



}