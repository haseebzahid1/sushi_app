class OrderDetail{
  final String title;
  final String img;
  final double totalPrice;
  final int orderNumber;
  final String time;
  final int orderId;
  final int contactCoinNumber;

  OrderDetail({
    required this.title,
    required this.img,
    required this.orderNumber,
    required this.totalPrice,
    required this.time,
    required this.orderId,
    required this.contactCoinNumber,
  });
}


List<OrderDetail> orderDetail = [
  OrderDetail(
    title: "The Fashion Meal by Josh ",
    img: "assets/icons/order_img.png",
    orderNumber: 04041360,
    totalPrice: 258.00,
    time: "03:23 PM, 6 September",
    orderId:308234567,
    contactCoinNumber: 8007899,
  ),  OrderDetail(
    title: "The Fashion Meal by Josh ",
    img: "assets/icons/order_img.png",
    orderNumber: 04041360,
    totalPrice: 248.00,
    time: "03:35 PM, 7 September",
    orderId:308234567,
    contactCoinNumber: 8007799,
  ),  OrderDetail(
    title: "The Fashion Meal by Josh ",
    img: "assets/icons/order_img.png",
    orderNumber: 04281360,
    totalPrice: 228.00,
    time: "04:23 PM, 8 September",
    orderId:308234567,
    contactCoinNumber: 8008891,
  ),
];