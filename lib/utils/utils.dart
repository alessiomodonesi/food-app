import 'package:food_app/types/product.dart';
import 'package:food_app/types/tag.dart';
import 'package:food_app/types/productTag.dart';

import 'dart:convert';
import 'endpoints.dart';
import 'dart:developer';
import 'package:dio/dio.dart';

Future<List<Tag>> getTag(id) async {
  try {
    Response response = await Dio().get(getTagUrl + id);
    return List.empty();
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<List<ProductTag>> getProductTag(id) async {
  try {
    Response response = await Dio().get(getProductTagUrl + id);
    return List.empty();
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<List<ProductTag>> getProduct(id) async {
  try {
    Response response = await Dio().get(getProductUrl + id);
    return List.empty();
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}
