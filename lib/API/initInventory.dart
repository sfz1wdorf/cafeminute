import 'package:cafeminute/product_view.dart';

import 'fetcher.dart';
var news;
var isopen;
var newsIDs;
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
    newsIDs = await fetchNewsIDs(url);
    news = await getHttp(url + "/getallnews", {}, "GET");
    var openRaw = await getHttp(url + "/isopen", {}, "GET");
    isopen = openRaw.toString().toLowerCase() == 'true';
    return "finished";
  }
  return "failed";
}
//s