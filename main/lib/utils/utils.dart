import 'package:food_app/types/product.dart';
import 'package:food_app/types/tag.dart';
import 'package:food_app/types/product_tag.dart';

import 'dart:convert';
import 'endpoints.dart';
import 'dart:developer';
import 'package:dio/dio.dart';

Future<List<Tag>> getTag(String id) async {
  try {
    Response response = await Dio().get(getTagUrl + id);
    return parseTag((response.data));
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<List<ProductTag>> getProductTag(id) async {
  try {
    Response response = await Dio().get(getProductTagUrl + id);
    return parseProductTag(response.data);
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<List<Product>> getProduct(id) async {
  try {
    Response response = await Dio().get(getProductUrl + id);
    log(response.data.toString());
    return parseProduct(jsonEncode(response.data));
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

List<Tag> parseTag(String responseBody) {
  List parsed = jsonDecode(responseBody);
  return parsed.map<Tag>((json) => Tag.fromJson(json)).toList();
}

List<ProductTag> parseProductTag(String responseBody) {
  List parsed = jsonDecode(responseBody);
  return parsed.map<ProductTag>((json) => ProductTag.fromJson(json)).toList();
}

List<Product> parseProduct(String responseBody) {
  List parsed = jsonDecode(responseBody);
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}
