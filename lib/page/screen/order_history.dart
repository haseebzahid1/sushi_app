import 'package:flutter/material.dart';
import 'package:sushi/model/order_history.dart';
import 'package:sushi/page/screen/order_detail.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';

import 'order_detail.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

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
          title:  const Text("Order History",style: kAppBarTitle,),
        backgroundColor: Colors.white,
        // elevation: 0,

      ),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView.builder(
          itemCount: orderProduct.length,
          itemBuilder: (context, index){
            OrderProduct orderProductItem = orderProduct[index];
          return Column(
            children: [
              SizedBox(height: size.height * 0.01,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderDetailPage()));
                },
                child: Container(
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

                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.lightBlue,
                                  )
                              ),
                              child: Column(
                                children:  [
                                   Text("${orderProductItem.orderNumber}",style: detailZeroText),
                                  Text("Coins",style: detailTextHeading_2.copyWith(fontSize: 14),),
                                ],
                              ),
                            ),
                            SizedBox(width: size.height * 0.02,),
                            Text(orderProductItem.title,style: detailClubHeading.copyWith(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(height: 2,),
                        Container(
                            width: size.width,
                            height: size.height * 0.18,
                            child: Image.asset(orderProductItem.img,fit: BoxFit.cover,)
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex:6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text("${orderProductItem.date} ${orderProductItem.month}",style: orderHeading),
                                  Text(orderProductItem.description, style: orderSubHeading),
                                ],
                              ),
                            ),
                            SizedBox(width: size.width * 0.04,),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 2),
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: darkBlue,
                                    )
                                ),
                                child: Column(
                                  children:   [
                                    Text(orderProductItem.smallTitle,style: detailZeroText),
                                    Text("${orderProductItem.totalPrice}",style:  detailZeroText,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
