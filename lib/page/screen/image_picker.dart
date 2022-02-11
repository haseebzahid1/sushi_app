import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sushi/style/constant.dart';


class ImagePickerScreen extends StatefulWidget {
  ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerState();



}

class _ImagePickerState extends State<ImagePickerScreen> {
  dynamic file;
   pickImage() async {
    XFile? image =  await ImagePicker().pickImage(source:ImageSource.gallery);
    if(image!=null){
      setState(() {
        // file = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
        title: const Text("Image Picker",style: kAppBarTitle,),
        leading: TextButton(
          child: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                pickImage();
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                  primary: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle:
                  const TextStyle(fontSize:20, fontWeight: FontWeight.bold)),
              child: const Text('Button'),
            ),
            Image.file(
              file,
              width: double.infinity,
              height: 500,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

}


// class ImagePickerWidget extends StatefulWidget {
//   const ImagePickerWidget({Key? key}) : super(key: key);
//
//   @override
//   _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
// }
//
// class _ImagePickerWidgetState extends State<ImagePickerWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//
//
//         ],
//       ),
//     );
//   }
// }
