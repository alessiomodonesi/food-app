// hostname
const android = "10.0.2.2:8080";
const ios = "localhost";
const vm = ":8081";

// url
const getTagUrl = "http://$ios/API/tag/getTag.php?tag_ID=";
const getProductUrl = "http://$ios/API/product/getProduct.php?PRODUCT_ID=";
const getProductTagUrl =
    "http://$ios/API/tag/product-tag/getArchiveProductTag.php?tag_id=";
const getArchieveIngredientsUrl =
    "http://$ios/API/product/getArchiveIngredients.php?panino=";
const postSignUpUrl =
    "http://192.168.1.100:80/food-api/API/user/registration.php";
const addItemCartUrl = "http://$ios/API/cart/setAddItem.php";
const postSignInUrl = "http://$ios/food-api/API/user/login.php";
const getCartUrl = "http://$ios/food-api/API/cart/getCart.php?user=";
