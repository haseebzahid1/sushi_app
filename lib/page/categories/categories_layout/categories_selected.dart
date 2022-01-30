import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/page/categories/provider.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/custom_button.dart';


class CategoriesDetailView extends StatelessWidget {
  const CategoriesDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectCountProvider>(
      create: (context) =>SelectCountProvider(),
      child: const CategoriesDetailViewWidget(),
    );
  }
}

class CategoriesDetailViewWidget extends StatelessWidget {
 const CategoriesDetailViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final selectCountProvider = Provider.of<SelectCountProvider>(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.7,
              child: Image.asset("assets/icons/image.png",fit: BoxFit.cover,),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                width: size.width,
                height: size.height * 0.45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  ),
                color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Wagyu Steak Roll",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                        SizedBox(height: size.height * 0.01,),
                        const Text("Order at least 3-4 hours in advance",style:  categoriesDetailViewTitle),
                        SizedBox(height: size.height * 0.01,),
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.27,
                              height: size.height * 0.04,
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  countButton(
                                      size: size,
                                      text: '-',
                                      fontSize: 24,onTab: selectCountProvider.increment
                                      ),
                                  Text("${selectCountProvider.count}",style: TextStyle(fontSize: 17,color: kCustomButton,fontWeight: FontWeight.bold)),
                                  countButton(
                                      size: size,
                                      text: '+',
                                      fontSize:19,
                                      onTab:selectCountProvider.decrement
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.02,),
                            GestureDetector(
                              onTap: (){
                                print("total");
                              },
                                child: Text("249.0",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:kCustomButton),)
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 10,
                      child: Column(
                        children: [
                          CustomButton(bgColor: kCustomButton, textButton: 'Order Now', width: size.width * 0.6, color: Colors.white,),
                        ],
                      ),
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector countButton({required Size size, required String text,required double fontSize,void Function()? onTab}){
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: size.width * 0.05,
        height: size.height * 0.05,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}
