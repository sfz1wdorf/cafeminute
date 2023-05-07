import 'package:cafeminute/API/initInventory.dart';
import 'package:cafeminute/product_view.dart';
import 'package:dio/dio.dart';

late String products;


List<String> fetchProductInfo(String id, url) {
  var idsString = productIDs;

  var productIndex = idsString.indexOf(id);
  var productsArrayRaw = products.toString().split("|");
  var product = productsArrayRaw[productIndex];
  var productArrayRaw = product.toString().split(";");
  List<String> productArray = [];
  for (var i = 0; i < productArrayRaw.length - 1; i++) {
    productArray.add(productArrayRaw[i].toString().substring(7));
  }
  return productArray;
}
List<String> fetchNewsInfo(String id, url) {
  var idsString = newsIDs;
  var newsIndex = idsString.indexOf(id);
  var newsArrayRaw = news.toString().split("|");
  var singlenews = newsArrayRaw[newsIndex];
  var productArrayRaw = singlenews.toString().split(";");
  List<String> newsArray = [];
  for (var i = 0; i < productArrayRaw.length - 1; i++) {
    newsArray.add(productArrayRaw[i].toString().substring(7));
  }
  return newsArray;
}
Future<List<String>> fetchProductIDs(url) async {
  var idsString = await getHttp("$url/getproductids", "", "GET");
  var ids = idsString.toString().split(",");
  return ids;
}
Future<List<String>> fetchNewsIDs(url) async {
  var idsString = await getHttp("$url/getnewsids", "", "GET");
  var ids = idsString.toString().split(",");
  return ids;
}


getHttp(path, dataset, method) async {
  try {
    var response;
    if (dataset != "") {
      response = await Dio().request(
        path,
        data: dataset,
        options: Options(method: method),
      ).timeout(const Duration(seconds: 3), onTimeout: () {return response;});
    } else {
      response = await Dio().request(
        path,
        options: Options(method: method),
      ).timeout(const Duration(seconds: 3), onTimeout: () {return response;});
    }
    return response;
  } catch (e) {
    return e;
  }
}



schedueleNotifications() async {}
