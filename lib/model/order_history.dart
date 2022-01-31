class OrderProduct{
  final String title;
  final String smallTitle;
  final int orderNumber;
  final String img;
  final double totalPrice;
  final int date;
  final String month;
  final String description;

  OrderProduct({
    required this.title,
    required this.smallTitle,
    required this.img,
    required this.totalPrice,
    required this.date,
    required this.month,
    required this.description,
    required this.orderNumber,

});
}


List<OrderProduct> orderProduct = [
  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      smallTitle: "HD",
      img: "assets/icons/image.png",
      totalPrice: 33.00,
      date: 6,
      month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 0,

  ),
  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      smallTitle: "HD",
      img: "assets/icons/image.png",
      totalPrice: 33.00,
      date: 7,
      month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 1,
  ),
  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      smallTitle: "HD",
      img: "assets/icons/image.png",
      totalPrice: 33.00,
      date: 8,
      month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 2,
  ),
  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      smallTitle: "HD",
      img: "assets/icons/image.png",
      totalPrice: 33.00,
      date: 9,
      month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 10,
  ),
  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      smallTitle: "HD",
      img: "assets/icons/image.png",
      totalPrice: 33.00,
      date: 10,
      month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 15,
  ),
];

