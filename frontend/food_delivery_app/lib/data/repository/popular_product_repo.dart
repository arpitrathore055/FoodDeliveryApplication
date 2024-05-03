import 'package:get/get.dart';

import '../../Utils/app_constants.dart';
import '../../models/popular_products_model.dart';
import '../API/API_Client.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData("api/v1/menus/products");
  }

  Future<Response> postPopularProducts(ProductModel productModel)async{
    Response response = await apiClient.postData(AppConstant.addPopularProductUrl, productModel.toJson());
    return response;
  }

}