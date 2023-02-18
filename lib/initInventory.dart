import 'package:cafeminute/product_view.dart';

import 'fetcher.dart';

var isopen;

init() async {
  products = await getHttp(url + "/getproducts", {}, "GET");
  productIDs = await fetchProductIDs(url);
  var openRaw = await getHttp(url + "/isopen", {}, "GET");
  isopen = openRaw.toString().toLowerCase() == 'true';
  return "finished";
}
//s