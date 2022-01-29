class OrderProduct{
  final String title;
  final String img;
  final String smallTitle;
  final double totalPrice;
  final int orderNumber;
  final int date;
  final String month;
  final String description;

  OrderProduct({
    required this.title,
    required this.img,
    required this.totalPrice,
    required this.smallTitle,
    required this.date,
    required this.month,
    required this.description,
    required this.orderNumber,
});
}


List<OrderProduct> orderProduct = [
  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      img: "assets/icons/image.png",
      totalPrice: 33.00, smallTitle: "HD",
      date: 6, month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 0,
  ),  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      img: "assets/icons/image.png",
      totalPrice: 33.00, smallTitle: "HD",
      date: 7, month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 1,
  ),  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      img: "assets/icons/image.png",
      totalPrice: 33.00, smallTitle: "HD",
      date: 8, month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 2,
  ),  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      img: "assets/icons/image.png",
      totalPrice: 33.00, smallTitle: "HD",
      date: 9, month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 10,
  ),  OrderProduct(
      title: "The Fashion Meal by Josh Yogesh",
      img: "assets/icons/image.png",
      totalPrice: 33.00, smallTitle: "HD",
      date: 10, month: "September",
      description: "Ground Floor, Phase 3, Building 10, Media city, Dubai, Uae",
      orderNumber: 15,
  ),
];