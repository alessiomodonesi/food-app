// hostname
const android = "10.0.2.2:8080";
const ios = "localhost";
const vm = "192.168.0.230:8081";
const raspserver = "192.168.0.22";
const raspberryModo = "192.168.61.150";

// const baseUrl = vm;
// const baseUrl = "$raspberryModo/food-api";
const baseUrl = "$ios/food-api";
// const baseUrl = "$android/food-api";

// url
const getTagUrl = "http://$baseUrl/API/tag/getTag.php?tag_ID=";
const getProductUrl = "http://$baseUrl/API/product/getProduct.php?PRODUCT_ID=";
const getProductTagUrl =
    "http://$baseUrl/API/tag/product-tag/getArchiveProductTag.php?tag_id=";
const getArchieveIngredientsUrl =
    "http://$baseUrl/API/product/getArchiveIngredients.php?panino=";
const postSignUpUrl = "http://$baseUrl/API/user/registration.php";
const addItemCartUrl = "http://$baseUrl/API/cart/setAddItem.php";
const postSignInUrl = "http://$baseUrl/API/user/login.php";
const getCartUrl = "http://$baseUrl/API/cart/getCart.php?user=";
const getUserUrl = "http://$baseUrl/API/user/getUser.php?id=";
const resetPassword = "http://$baseUrl/API/user/resetPass.php";
const getProductsLike =
    "http://$baseUrl/API/product/getProductLike.php?nome_panino=";
const getProductsLikeWithTagUrl =
    "http://$baseUrl/API/product/getArchiveProductsLikeWithTag.php?nome_panino=";
const setCartItemRemoveUrl = "http://$baseUrl/API/cart/setRemove.php";
const setCartItemAddUrl = "http://$baseUrl/API/cart/setAdd.php";
const getPickupUrl = "http://$baseUrl/API/order/pickup/getPickup.php";
const getPickupIdBreakUrl =
    "http://$baseUrl/API/order/pickup/getPickupIdBreak.php?PICKUP_ID=";
const getBreakUrl = "http://$baseUrl/API/order/break/getBreak.php?BREAK_ID=";
const setOrderUrl = "http://$baseUrl/API/order/setOrder.php";
const deleteCartItemUrl = "http://$baseUrl/API/cart/deleteItem.php?user=";
