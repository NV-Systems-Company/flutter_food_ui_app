class Food {
  String name;
  double price;
  int rating;
  String description;
  String imageUrl;

  Food({
    this.description,
    this.name,
    this.price,
    this.rating,
    this.imageUrl,
  });
}

List<Food> foods = [
  Food(
    name: 'Baked chilli',
    description:
        'Jacket potatoes and chilli are great comfort food when the nights draw in. Make ours in the week when you\'re short on time for a nutritious family dinner',
    price: 18.75,
    rating: 4,
    imageUrl: 'assets/images/image1.jpg',
  ),
  Food(
    name: 'Mexican chicken burger',
    description:
        'Ready in under 20 minutes, this burger with spiced chipotle chicken breast, in toasted brioche with guacamole, makes for a satisfying weeknight treat for one',
    price: 8.75,
    rating: 5,
    imageUrl: 'assets/images/image2.jpg',
  ),
  Food(
    name: 'Beef bourguignon',
    description:
        'The secret to this super-rich beef casserole is to use all wine and no stock',
    price: 13.00,
    rating: 3,
    imageUrl: 'assets/images/image3.jpg',
  ),
  Food(
    name: 'Peruvian chicken',
    description:
        'Fed up with pasta salad? This gluten-free alternative is packed with lean protein from the chicken, and healthy, heart-friendly fats from the avocado',
    price: 11.50,
    rating: 4,
    imageUrl: 'assets/images/image4.jpg',
  ),
  Food(
    name: 'Asparagus',
    description:
        'A simple, low-calorie spring main that uses the season\'s finest ingredients and is ready in just 20 minutes',
    price: 12.50,
    rating: 5,
    imageUrl: 'assets/images/image5.jpg',
  ),
];
