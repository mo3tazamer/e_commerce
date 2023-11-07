import '../entites/products.dart';

abstract class BaseGetProductsRepo{

  Future<List<Products>> getProduct();



}