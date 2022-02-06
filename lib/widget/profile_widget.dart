import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        container(),
        Positioned(
          bottom: 0,
          right: 4,
          child: buildEditIcon(color),
        ),
      ],
    );
  }


  Container container(){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
      color: Colors.white,
       image: DecorationImage(
         image: AssetImage(imagePath,),fit: BoxFit.cover
       ),
       borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child: buildCircle(
      color: color,
      all: 6,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 17,
      ),
    ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
