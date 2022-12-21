import 'package:flutter/cupertino.dart';
import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/tag.dart';
import 'package:sandwech/types/product_tag.dart';
import 'package:sandwech/types/ingredient.dart';
import 'package:sandwech/types/user.dart';

import 'dart:convert';
import 'endpoints.dart';
import 'dart:developer';
import 'package:dio/dio.dart';

Future<List<Tag>> getTag(String id) async {
  try {
    Response response = await Dio().get(getTagUrl + id);
    log(response.toString());
    return parseTag((response.data));
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<List<ProductTag>> getProductTag(id) async {
  try {
    Response response = await Dio().get(getProductTagUrl + id);
    log(response.toString());
    return parseProductTag(response.data);
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<List<Product>> getProducts(id) async {
  try {
    Response response = await Dio().get(getProductUrl + id);
    log(response.toString());
    return parseProducts(jsonEncode(response.data));
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

// il ? sta a indicare che la funzione può tornare Product oppure null
Future<Product?> getSingleProduct(id) async {
  try {
    Response response = await Dio().get(getProductUrl + id);
    log(response.toString());
    return parseSingleProduct(jsonEncode(response.data));
  } catch (e) {
    log(e.toString());
    return null;
  }
}

Future<List<Ingredient>> getArchieveIngredients(id) async {
  try {
    Response response = await Dio().get(getArchieveIngredientsUrl + id);
    log(response.toString());
    return parseArchieveIngredients(jsonEncode(response.data));
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<String> addItemCart(userID, productID, quantity) async {
  try {
    var response = await Dio().post(addItemCartUrl,
        data: {"user": userID, "product": productID, "quantity": quantity});
    log(response.toString());
    return jsonEncode(response.data);
  } catch (e) {
    log(e.toString());
    return "error";
  }
}

Future<User> getUser(userID) async {
  try {
    Response response = await Dio().get(getUserUrl + userID);
    log(response.toString());
    return parseGetUser(jsonEncode(response.data));
  } catch (e) {
    log(e.toString());
    return const User(name: "", surname: "");
  }
}

Future<List<Product>> getCart(userID) async {
  try {
    Response response = await Dio().get(getCartUrl + userID);
    log(response.toString());
    //log(getCartUrl + userID);
    return parseCart(jsonEncode(response.data));
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

List<Tag> parseTag(String responseBody) {
  List parsed = jsonDecode(responseBody);
  //log(parsed.toString());
  return parsed.map<Tag>((json) => Tag.fromJson(json)).toList();
}

List<ProductTag> parseProductTag(String responseBody) {
  List parsed = jsonDecode(responseBody);
  //debugPrint(parsed.toString());
  return parsed.map<ProductTag>((json) => ProductTag.fromJson(json)).toList();
}

List<Product> parseProducts(String responseBody) {
  List parsed = jsonDecode(responseBody);
  //log(parsed.toString());
  return parsed.map<Product>((json) => Product.fromJson(json)).toList();
}

Product parseSingleProduct(String responseBody) {
  List parsed = jsonDecode(responseBody);
  //log(parsed.toString());
  return parsed.map<Product>((json) => Product.fromJson(json)).toList()[0];
}

List<Ingredient> parseArchieveIngredients(String responseBody) {
  List parsed = jsonDecode(responseBody);
  //log(parsed.toString());
  return parsed.map<Ingredient>((json) => Ingredient.fromJson(json)).toList();
}

User parseGetUser(String responseBody) {
  List parsed = jsonDecode(responseBody);
  //log(parsed.toString());
  return parsed.map<User>((json) => User.fromJson(json)).toList()[0];
}

List<Product> parseCart(String responseBody) {
  List parsed = jsonDecode(responseBody);
  return parsed.map<Product>((json) => Product.fromJsonCart(json)).toList();
}
