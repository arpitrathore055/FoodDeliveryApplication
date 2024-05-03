import 'package:get/get.dart';

import '../../Utils/app_constants.dart';
import '../../models/popular_products_model.dart';
import '../API/API_Client.dart';

class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData("api/v1/menus/products?pageSize=20");
  }

  Future<Response> postRecommendedProducts(ProductModel productModel)async{
    Response response = await apiClient.postData(AppConstant.addRecommendedProductUrl, productModel);
    return response;
  }

}