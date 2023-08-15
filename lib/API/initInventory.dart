import 'dart:ui';

import 'package:cafeminute/API/utils.dart';
import 'package:cafeminute/product_view.dart';
import 'package:flutter/scheduler.dart';

import '../main.dart';
import 'fetcher.dart';

var news;
var isopen;
var schedule;
var isConnected = false;
var newsIDs;
init() async {
  var validation;
  try {
    validation = await getHttp("$url/", {}, "GET");
    if (validation == null) {
      isConnected = false;
      return "failed";
    }
  } catch (e) {
    isConnected = false;
    return "failed";
  }
  if (validation.toString() == "Root Route!") {
    products = (await getHttp(url + "/getproducts", {}, "GET")).toString();
    productIDs = await fetchProductIDs(url);
    newsIDs = await fetchNewsIDs(url);
    news = await getHttp(url + "/getallnews", {}, "GET");
    schedule = await getHttp(url + "/getschedule", {}, "GET");
    isConnected = true;
    var openRaw = await getHttp(url + "/isopen", {}, "GET");
    isopen = openRaw.toString().toLowerCase() == 'true';
    return "finished";
  }
  isConnected = false;
  return "failed";
}

//s
Future<bool> checkConnection() async {
  var validation;
  try {
    validation = await getHttp(url + "/", {}, "GET");
  } catch (e) {
    return false;
  }

  if (validation.toString() == "Root Route!") {
    if (isConnected == false) {
      isConnected = true;
      init();
    } else {
      isConnected = true;
    }
    return true;
  }
  isConnected = false;
  return false;
}
