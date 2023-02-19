import 'package:cafeminute/product_view.dart';

import 'fetcher.dart';

var isopen;

init() async {
  var validation;
  try {
    validation = await getHttp(url + "/", {}, "GET");
  } catch (e) {
    return "failed";
  }
  if (validation.toString() == "Root Route!") {
    products = await getHttp(url + "/getproducts", {}, "GET");
    productIDs = await fetchProductIDs(url);
    var openRaw = await getHttp(url + "/isopen", {}, "GET");
    isopen = openRaw.toString().toLowerCase() == 'true';
    return "finished";
  }
  return "failed";
}
//s