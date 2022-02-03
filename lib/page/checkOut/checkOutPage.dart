import 'package:flutter/material.dart';
import 'package:sushi/page/screen/drawer_header.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/custom_button.dart';

class CheckOutPage extends StatefulWidget {
   CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
   List <String> _locations = ['A', 'B', 'C', 'D'];
   List<String> paymentMethod = ["Cash", "By Card"];
   String? _selectedLocation;
   String? _payment;
   TextEditingController address = TextEditingController();
   TextEditingController name = TextEditingController();
   TextEditingController phoneNumber = TextEditingController();
   TextEditingController tableNumber = TextEditingController();
   TextEditingController instruction = TextEditingController();
  @override
  int count = 1;
   double price = 249.00;

   void increment(){
     setState(() {
       if(count> 1){
         count--;
       }
     });
   }
   void  decrement(){
     setState(() {
       count++;
     });
   }
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final formState = GlobalKey<FormState>();
    return Scaffold(
     appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
        title: const Text("Check Out",style: kAppBarTitle,),
      ),
      drawer:const Drawer(
        child: MyDrawerList(),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: size.width,
                    height: 40,
                    decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(color: Colors.black12, offset: Offset(2.0, 2.0))
                    ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: boldblackText.copyWith(fontSize: 20),),
                          Text("249.00 DH", style: boldblackText.copyWith(fontSize: 20,color: Colors.blue),)
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pickup Time",
                          style: viewAllText,
                        ),
                        DropdownButton(
                          isExpanded: true,
                          hint: Text(
                            'Please Select your time',
                            style: normalText,
                          ), // Not necessary for Option 1
                          value: _selectedLocation,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue.toString();
                            });
                          },
                          items: _locations.map(( String location) {
                            return DropdownMenuItem(
                              child:  Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ],
                    )),
                textFormField(title:'Address',hintText: "Enter Your Address",controller:address ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "payment Method",
                        style: viewAllText,
                      ),
                      DropdownButton(
                          isExpanded: true,
                          hint: Text(
                            'Please Select Payment Method',
                            style: normalText,
                          ), // Not necessary for Option 1
                          value: _payment,
                          items: paymentMethod.map((String location){
                            return DropdownMenuItem(
                                child: Text(location),
                               value: location,
                            );
                          }).toList(),
                          onChanged: (newValue){
                            setState(() {
                              _payment = newValue.toString();
                            });
                          }
                      ),
                      Text(
                        "Prices are inclusive of 5% VAT",
                        style: normalText,
                      )
                    ],
                  ),
                ),
                textFormField(title:'Name',hintText: "Enter your Name",controller:name ),
                textFormField(title:'Phone',hintText: "+92",controller:phoneNumber ),
                textFormField(title:'Table Number',hintText: "Enter your Answer",controller:tableNumber ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Number of Guest",
                        style: normalText,
                      ),
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
                                fontSize: 24,onTab:increment
                            ),
                            Text("${count}",style: const TextStyle(fontSize: 17,color: kCustomButton,fontWeight: FontWeight.bold)),
                            countButton(
                                size: size,
                                text: '+',
                                fontSize:19,
                                onTab:decrement
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                textFormField(title:'Special Instructions',hintText: "Your Answer",controller:instruction ),
                SizedBox(height: 10,),
                Center(
                    child: CustomButton(
                      textButton: 'Place Order',
                      size: 17.5,
                      color: Colors.white,
                      bgColor: Colors.lightBlue,
                      width: size.width * 0.6,
                      padding:EdgeInsets.symmetric(vertical: 10.3),
                    )
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Padding textFormField({required String title,required String? hintText,TextEditingController? controller}){
    return  Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address",
            style: viewAllText,
          ),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: normalText),
          ),
        ],
      ),
    );
  }

   GestureDetector countButton({required Size size, required String text,required double fontSize,void Function()? onTab}){
     return GestureDetector(
       onTap: onTab,
       child: Container(
         width: size.width * 0.05,
         height: size.height * 0.05,
         decoration: const BoxDecoration(
             shape: BoxShape.circle,
             color: Colors.white
         ),
         child: Center(child: Text(text,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w500),)),
       ),
     );
   }
}
