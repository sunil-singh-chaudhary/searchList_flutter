class Restaurant {
  final String name;
  final double rating;
  final String cuisine;
  final double price;

  Restaurant({
    required this.name,
    required this.rating,
    required this.cuisine,
    required this.price,
  });
}

class SearchStyle {
  final bool name;
  final bool rating;
  final bool cuisine;
  final bool price;

  SearchStyle({
    required this.name,
    required this.rating,
    required this.cuisine,
    required this.price,
  });
}

List<Restaurant> restaurantList = [
  Restaurant(name: "Restaurant A", rating: 4.5, cuisine: "Italian", price: 200),
  Restaurant(name: "Restaurant B", rating: 3.8, cuisine: "Mexican", price: 100),
  Restaurant(name: "Restaurant C", rating: 4.2, cuisine: "Chinese", price: 200),
  Restaurant(
      name: "Restaurant D", rating: 4.9, cuisine: "Japanese", price: 330),
  Restaurant(name: "Restaurant E", rating: 3.5, cuisine: "Indian", price: 220),
  Restaurant(
      name: "Restaurnt F", rating: 4.0, cuisine: "Steakhouse", price: 38),
  Restaurant(name: "Restaurant G", rating: 3.7, cuisine: "Burger", price: 1),
  Restaurant(name: "Restaurant H", rating: 4.6, cuisine: "Seafood", price: 3),
  Restaurant(name: "Restaurant I", rating: 4.3, cuisine: "Thai", price: 2),
  Restaurant(name: "Restaurant J", rating: 3.2, cuisine: "Pizza", price: 1),
  Restaurant(name: "Restaurant K", rating: 4.8, cuisine: "French", price: 3),
  Restaurant(name: "Restaurant L", rating: 3.9, cuisine: "Sushi", price: 2),
];
