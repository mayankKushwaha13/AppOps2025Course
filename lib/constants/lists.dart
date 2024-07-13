import 'package:sabjiwallah/models/fruits.dart';
import 'package:sabjiwallah/models/vegetables.dart';

import '../models/cart.dart';

List<Vegetables> vegetables = [
  Vegetables(name: "Potato", image: "lib/assets/potato.png", price: 33.65,),
  Vegetables(name: "Brinjal", image: "lib/assets/brinjal.png", price: 49,),
  Vegetables(name: "Tomato", image: "lib/assets/tomato.png", price: 67.44,),
  Vegetables(name: "Cabbage", image: "lib/assets/cabbage.png", price: 41,),
];

List<Fruits> fruits = [
  Fruits(name: "Apple", image: "lib/assets/apple.png", price: 115),
  Fruits(name: "Banana", image: "lib/assets/banana.png", price: 40),
  Fruits(name: "Mango", image: "lib/assets/mango.png", price: 58.58),
  Fruits(name: "Pineapple", image: "lib/assets/pineapple.png", price: 74),
];

List<Cart> cart = [];

addToCart(Cart item) {
  cart.add(item);
}

removeFromCart(int index) {
  cart.removeAt(index);
}

String calculateTotal() {
  double total = 0;
  for (int i = 0; i < cart.length; i++){
    total += cart[i].price;
  }
  return total.toStringAsFixed(2);
}