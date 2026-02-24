void main() {
  var seller1 = Seller(101, "Ayman", "ayman@gmail.com", false, "Ayman's Store", 10);
  seller1.login();
  seller1.addProduct("Hand Cream");
  seller1.addProduct("Face Wash");
  seller1.addProduct("Scrub");
  seller1.addProduct("Sunblock");

  seller1.removeProduct("Scrub");

  var cust1 = Customer(1001, "Sarah", "ali@gmail.com", false, "ABC Street", 10000);
  cust1.login();
  cust1.addToCart("Sunblock");
  cust1.placeOrder();
  cust1.logout();
}

class User {
  int id;
  String name;
  String email;
  bool isLoggedIn = false;

  User(this.id, this.name, this.email, this.isLoggedIn);

  void login() {
    print("$name with email: $email is logging in...");
    isLoggedIn = true;
  }

  void logout() {
    print("$name is logging out!!");
    isLoggedIn = false;
  }
}

class Customer extends User {
  String shippingAddress;
  double walletBalance;
  List<String> cartItems = [];

  Customer(
    int id,
    String name,
    String email,
    bool isLoggedIn,
    this.shippingAddress,
    this.walletBalance,
  ) : super(id, name, email, isLoggedIn);

  void placeOrder() {
    print("$name is placing their order with $walletBalance balance.");
  }

  void addToCart(String item) {
    print("Adding New Item to Cart...");
    cartItems.add(item);
  }
}

class Seller extends User {
  String storeName;
  List<String> products = [];
  double ratings;

  Seller(
    int id,
    String name,
    String email,
    bool isLoggedIn,
    this.storeName,
    this.ratings,
  ) : super(id, name, email, isLoggedIn);

  void addProduct(String product){
    print("$name is Adding new product to store...");
    products.add(product);
    print("$product is added!");
  }

  void removeProduct(String product){
    print("$name is removing $product product from store...");
    products.remove(product);
  }
}