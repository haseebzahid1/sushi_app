class PageViewImage{
  final String img;
  final String logoImg;
  final String title;
  final String description;

  PageViewImage({
    required this.img,
    required this.logoImg,
    required this.description,
    required this.title,
});
}

List<PageViewImage> pageViewImage = [
  PageViewImage(
    title: "Order food From Your Favourite Restaurant",
    description:"Choose the flavor you desire for Order at your  table in just a click",
    img: "assets/images/icon1.png",
    logoImg: "assets/images/logo.png",
  ),PageViewImage(
    title: "Order food From Your Favourite Restaurant",
    description:"Easy payment integration and give you more option pay at your convenience",
    img: "assets/images/icon2.png",
    logoImg: "assets/images/logo.png",
  ),PageViewImage(
    title: "Order food From Your Favourite Restaurant 3",
    description:"We served the best Hookah in town place your order with a single click",
    img: "assets/images/icon3.png",
    logoImg: "assets/images/logo.png",
  ),
];