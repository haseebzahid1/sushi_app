class ContactModel{

  String name, title, img;
  bool isSelected;

  ContactModel({
    required this.name,
    required this.title,
    required this.isSelected,
    required this.img,
  });

}

List<ContactModel> contacts = [
  ContactModel(
      name: "Pick Up",
      title:"Well prepare and pack your",
      isSelected: false,
      img: "assets/icons/shopping-bag.png"
  ),
  ContactModel(
      name: "Dine in",
      title:"Well prepare and pack your",
      isSelected: false,
      img: "assets/icons/shoe-shop.png"
  ),
  ContactModel(
      name: "Delivery",
      title:"Well prepare and pack your",
      isSelected: false,
      img: "assets/icons/delivery-man.png"
  ),

];