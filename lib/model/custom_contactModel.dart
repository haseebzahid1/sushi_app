class ContactModel{
  int? id;
  String title, description, img;
  bool isSelected;

  ContactModel({
    this.id,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.img,
  });
}

// List<ContactModel> orderItem = [
//   ContactModel(
//       title: "Pick Up",
//       description:"Well prepare and pack your",
//       isSelected: false,
//       img: "assets/icons/shopping-bag.png"
//   ),
//   ContactModel(
//       title: "Dine in",
//       description:"Well prepare and pack your",
//       isSelected: false,
//       img: "assets/icons/shoe-shop.png"
//   ),
//   ContactModel(
//       title: "Delivery",
//       description:"Well prepare and pack your",
//       isSelected: false,
//       img: "assets/icons/delivery-man.png"
//   ),
// ];