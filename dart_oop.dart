void main()
{
  print("This is dart oop file, Task 1.3");
  User user=User("Ali", "ali@email.com");
  Admin admin=Admin("Ayesha", "admin@email.com");

  print("User Name:${user.name}");
  print(admin);

  user.setName("Ali Khan");
  print("Updated User Name: ${user.name}");

  Animal dog=Dog();
  Animal cat=Cat();

  dog.makeSound();
  cat.makeSound();

  Product p1=Product("Laptop", 120000);
  Product p2=Product("Mouse", 1500);
  Product p3=Product("Keyboard", 3500);
  ShoppingCart cart=ShoppingCart();
  cart.addProduct(p1);
  print("Total cart price:${cart.calculateTotal()}");
  cart.addProduct(p2);
  cart.addProduct(p3);
  print("Total cart price:${cart.calculateTotal()}");

  cart.removeProduct(p3);
  print("Total cart price after removing keyboard:${cart.calculateTotal()}");
}

class User{
  String _name;
  String _email;

  User(this._name, this._email);
  User.withDetails(String name, String email):_name=name, _email=email;

  String get name=> _name;
  String get email=> _email;

  String setName(String name){
    _name = name;
    return _name;
  }
  String setEmail(String email){
    _email = email;
    return _email;
  }
}

class Admin extends User{
  Admin(String name, String email):super(name, email);

  @override
  String toString() {
    return "Admin[name: $name, email: $email]";
  }
}

abstract class Animal{
  void makeSound();
}

class Dog extends Animal{
  @override
  void makeSound(){
    print("Barks of a Dog");
  }
}

class Cat extends Animal{
  @override
  void makeSound(){
    print("Meows of a Cat");
  }
}

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class ShoppingCart {
  List<Product> _products=[];

  void addProduct(Product product){
    _products.add(product);
  }

  void removeProduct(Product product){
    _products.remove(product);
  }

  double calculateTotal(){
    return _products.fold(0,(sum,item)=>sum+item.price);
  }
}


