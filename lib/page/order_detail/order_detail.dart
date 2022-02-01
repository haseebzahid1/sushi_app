import 'package:flutter/material.dart';
import 'package:sushi/model/order_detail.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/custom_button.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
          iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
          title:   Text("Order Detail",style: kOrderAppVBarTitle.copyWith(fontSize: 16),),
          backgroundColor: Colors.white,
          // elevation: 0,

        ),
        body: Container(
          margin: EdgeInsets.only(top: 4,bottom: 4),
          child: ListView.builder(
            itemCount: orderDetail.length,
            itemBuilder: (context, index){
              OrderDetail orderDetailItem = orderDetail[index];
              return Column(
                children: [
                  SizedBox(height: size.height * 0.01,),
                  Container(
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          spreadRadius: 6,
                          offset: const Offset(-0.8,-0.2),
                          color: Colors.grey.withOpacity(0.2),)
                      ],

                    ),
                    child: Container(

                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.01,),
                        const Text("Your Type",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "Avenger",color: Colors.black)),
                          SizedBox(height: size.height * 0.02,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width * 0.23,
                                height: size.height * 0.12,
                                child: Image.asset(orderDetailItem.img,fit: BoxFit.cover,),
                              ),
                              SizedBox(width: size.width * 0.02,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: orderDetailSubHeading.copyWith(color: Colors.black),
                                        children:  [
                                          TextSpan(text: '${orderDetailItem.title}\n',style: orderDetailHeading),
                                          TextSpan(text: 'Order #${orderDetailItem.orderNumber}\n', ),
                                          TextSpan(text: '${orderDetailItem.time}\n',),
                                          TextSpan(text: '${orderDetailItem.totalPrice} DH',),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Address",style: orderDetailSubHeading.copyWith(fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(height: size.height * 0.02,),
                              Text("Cash",style: orderDetailSubHeading.copyWith(color: Colors.grey)),
                              SizedBox(height: size.height * 0.01,),
                              Row(
                                children:  [
                                  Text("Total",style: orderDetailSubHeading.copyWith(fontSize: 14,color: Colors.black38),),
                                  Spacer(),
                                  Text("${orderDetailItem.totalPrice}",style: orderDetailSubHeading,),
                                ],
                              ),
                              SizedBox(height: size.height * 0.02,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(text: 'Contact Info : ',style: privacyHeadingStyle),
                                    TextSpan(text: '${orderDetailItem.contactCoinNumber}', style: privacyHeadingStyle.copyWith(color: Colors.blue,fontSize: 12),),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(text: 'Your ID : ',style: privacyHeadingStyle),
                                    TextSpan(text: '${orderDetailItem.orderId}', style: privacyHeadingStyle.copyWith(color: Colors.blue,fontSize: 12),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.03,),
                          CustomButton(
                            textButton: 'Order Again',
                            width: size.width,
                            color: Colors.white,
                            bgColor: kCustomButton,
                            size: 22,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            onTap: (){},),
                          SizedBox(height: size.height * 0.04,),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },),
        )
    );
  }
}
