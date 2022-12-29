import 'package:sandwech/types/break.dart';
import 'package:sandwech/types/pickup_break.dart';
import 'package:sandwech/types/product.dart';
import 'package:sandwech/types/tag.dart';
import 'package:sandwech/types/product_tag.dart';
import 'package:sandwech/types/ingredient.dart';
import 'package:sandwech/types/user.dart';
import 'package:sandwech/types/pickup.dart';

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

Future<List<Product>> getProductsLikeWithTag(name, int id_cat) async {
  try {
    Response response =
        await Dio().get("${getProductsLikeWithTagUrl + name}&tag_id=$id_cat");
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

// aggiorna di 1 la quantità di un prodotto nel carrello
Future<String> setCartItemRemove(userID, productID) async {
  try {
    var response = await Dio()
        .put(setCartItemRemoveUrl, data: {"user": userID, "prod": productID});
    log(response.toString());
    return jsonEncode(response.data);
  } catch (e) {
    log(e.toString());
    return "error";
  }
}

Future<String> setCartItemAdd(userID, productID) async {
  try {
    var response = await Dio()
        .put(setCartItemAddUrl, data: {"user": userID, "product": productID});
    log(response.toString());
    return jsonEncode(response.data);
  } catch (e) {
    log(e.toString());
    return "error";
  }
}

Future<String> setOrder(
    int user, double total, bbreak, status, pickup, products, json) async {
  try {
    var response = await Dio().post(setOrderUrl, data: {
      "user": user,
      "total_price": total,
      "break": int.parse(bbreak),
      "status": status,
      "pickup": int.parse(pickup),
      "products": jsonDecode(products),
      "json": jsonDecode(json)
    });
    log(response.toString());
    return jsonEncode(response.data);
  } catch (e) {
    log(e.toString());
    return "error";
  }
}

Future<String> deleteCartItem(user, product) async {
  try {
    var response = await Dio()
        .get("${deleteCartItemUrl + user.toString()}&product=$product");
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
    return User(name: "", surname: "");
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

Future<List<Pickup>> getPickupZones() async {
  try {
    Response response = await Dio().get(getPickupUrl);
    //log(response.toString());
    return parsePickupZones(jsonEncode(response.data));
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<List<PickupBreak>> getPickupIdBreak(id) async {
  try {
    Response response = await Dio().get(getPickupIdBreakUrl + id);
    //log(response.toString());
    return parsePickupBreak(jsonEncode(response.data));
  } catch (e) {
    log(e.toString());
    return List.empty();
  }
}

Future<List<Break>> getBreak(id) async {
  try {
    Response response = await Dio().get(getBreakUrl + id);
    log(response.toString());
    return parseBreak(jsonEncode(response.data));
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

List<Pickup> parsePickupZones(String responseBody) {
  List parsed = jsonDecode(responseBody);
  return parsed.map<Pickup>((json) => Pickup.fromJson(json)).toList();
}

List<PickupBreak> parsePickupBreak(String responseBody) {
  List parsed = jsonDecode(responseBody);
  return parsed.map<PickupBreak>((json) => PickupBreak.fromJson(json)).toList();
}

List<Break> parseBreak(String responseBody) {
  List parsed = jsonDecode(responseBody);
  return parsed.map<Break>((json) => Break.fromJson(json)).toList();
}
