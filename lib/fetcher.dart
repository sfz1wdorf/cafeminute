import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cafeminute/main_page.dart';
import 'package:cafeminute/product_view.dart';
import 'package:dio/dio.dart';

var products;
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

Future<List<String>> fetchProductIDs(url) async {
  var idsString = await getHttp("$url/getproductids", "", "GET");
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
      );
    } else {
      response = await Dio().request(
        path,
        options: Options(method: method),
      );
    }
    return response;
  } catch (e) {
    return e;
  }
}

schedueleNotifications() async {}
