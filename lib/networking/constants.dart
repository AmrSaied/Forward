class ApiConstants {
  static var environment = ENVIRONMENT.prod;
  static const baseUrl =
      'https://my-json-server.typicode.com/SharminSirajudeen/test_resources/';

  //endpoints
  static const users = 'users';
  static const posts = 'posts';

  static const defaultSubStatus = 0;
  static bool enableMockUp = false;
}

class CacheStorageKeys {
  static const basketProductsKey = 'basket_products_key';
  static const profileModel = 'profile_model';
  static const appLocale = 'app_locale';
  static const products = 'products';
  static const addresses = 'addresses';
  static const authorizations = "authorizations";
  static const policy = "policy";
}

enum ENVIRONMENT {
  dev,
  qc,
  prod,
  mockUp,
}
