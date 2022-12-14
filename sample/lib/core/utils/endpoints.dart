const serverAddress = "192.168.43.110";
const serverPort = "80";

getHost(serverAddress, serverPort) {
  return "http://" + serverAddress + ":" + serverPort;
}

var getTagUrl =
    getHost(serverAddress, serverPort) + "/food-api/API/tag/getTag.php?tag_ID=";
// const getTagUrl = "https://raw.githubusercontent.com/alessiomodonesi/food-api/main/API/tag/getTag.php?tag_ID=";

var getProductTagUrl = getHost(serverAddress, serverPort) +
    "/food-api/API/tag/product-tag/getArchiveProductTag.php?tag_id=";
// const getProductTagUrl = "https://raw.githubusercontent.com/alessiomodonesi/food-api/main/API/tag/product-tag/getArchiveProductTag.php?tag_id=";

var getProductUrl = getHost(serverAddress, serverPort) +
    "food-api/API/product/getProduct.php?PRODUCT_ID=";
// const getProductUrl = "https://raw.githubusercontent.com/alessiomodonesi/food-api/main/API/product/getProduct.php?PRODUCT_ID=";

var postSignUpUrl =
    getHost(serverAddress, serverPort) + '/food-api/API/user/registration.php';
