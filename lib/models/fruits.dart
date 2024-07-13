class Fruits{
  final String name;
  final String image;
  final double price;
  double amount; 

  Fruits(
    {
      required this.name,
      required this.image,
      required this.price,
      this.amount = 1,
    }
  );
}