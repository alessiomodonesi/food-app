// hostname
const android = "10.0.2.2:8080";
const ios = "localhost";
const vm = "192.168.223.212:8081";

//const baseUrl = vm;
const baseUrl = "$ios/food-api";

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
const resetPassword = "http://$baseUrl/API/user/resetPassword.php";
