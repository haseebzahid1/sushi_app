import 'package:flutter/material.dart';
import 'package:sushi/model/sliver_model.dart';
import 'package:sushi/style/theme.dart';

class SliversDemo extends StatefulWidget {
  const SliversDemo({Key? key}) : super(key: key);

  @override
  _SliversDemoState createState() => _SliversDemoState();
}

class _SliversDemoState extends State<SliversDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int count = 1;
  double price = 2.2000;

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


  bool _customTileExpanded = false;
  final List<CheckBoxState>check_notification = [
    CheckBoxState(title: "Without Straw", ),
    CheckBoxState(title: "With Straw"),

    // CheckBoxState(title: "Calls"),
  ];
  Widget _buildFixedList(Color color, String _text) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          _text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Color(0xFFEDF2F8),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            // floating: true,
            leading: TextButton(
              child: Icon(Icons.close,color: Colors.white,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: kCustomButton,
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background:Image.asset("assets/images/slvier_top-img.png",fit: BoxFit.cover,)
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 10,
              width: size.width,
              color: Colors.white,
            ),
          ),
          SliverFillRemaining(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0,left: 20,right: 20),
                        child: Text("Lemon Mint",style: TextStyle(fontSize: 20,color:Colors.black ,fontFamily:"Avenir",fontWeight: FontWeight.w600 ),),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        color: Colors.white,
                        child: Column(
                          children:   <Widget>[
                            ExpansionTile(
                                onExpansionChanged: (bool expanded) {
                                  setState((){
                                    _customTileExpanded = expanded;
                                  }
                                  );
                                },
                                title: const Text(
                                  "Environment-Friendly",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                      fontFamily:"Avenir"
                                  ),
                                ),
                                // trailing: Icon(Icons.expand_more,color: Colors.grey,),
                                trailing: _customTileExpanded?Icon(Icons.expand_less,color: Colors.grey,):Icon(Icons.expand_more,color: Colors.grey,),
                                subtitle:_customTileExpanded? Text('Not Selected',style: const TextStyle(color: Colors.grey),):
                                Text('Tab to Selected',style: const TextStyle(color: Colors.grey, fontFamily:"Avenir",fontWeight: FontWeight.w400),),

                                children: [
                                  ...check_notification.map((item) => buildSingCheckbox(item)).toList(),
                                ]
                            ),
                          ],
                        ),
                      ) ,
                      // SizedBox(height: 30,),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   child: Row(
                      //     children: [
                      //       RoundIconButton(icon: Icons.remove, onPress: (){},
                      //         btnTextColor: Colors.white,btnColor: Colors.white,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              countIconButton(icon: Icons.horizontal_rule,onTap: increment),
                              Text("${count}",style: TextStyle(fontSize: 17,color: Colors.blue,fontWeight: FontWeight.bold)),
                              countIconButton(icon: Icons.add,onTap: decrement),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 25,),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                          decoration: BoxDecoration(
                            color: kCustomButton,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text("Add",style: TextStyle(fontSize: 17.5,color: Colors.white,fontWeight: FontWeight.w500,fontFamily:"Avenir"),),
                              Spacer(),
                              Text("${(count*price).toStringAsFixed(2)} BHd",style: TextStyle(fontSize: 17.5,color: Colors.white,fontWeight: FontWeight.w500,fontFamily:"Avenir")),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget countIconButton({void Function()? onTap,required IconData icon}){
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 20, height: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            side:BorderSide(color:Colors.grey,width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            )
        ),
        child:  Icon(icon,size: 14,color: Colors.grey,),
        onPressed: onTap,
      ),
    );
  }

  Widget buildSingCheckbox(checkbox) {
    return CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          "${checkbox.title}",
            style: TextStyle(fontSize: 13,color: Colors.grey,fontWeight: FontWeight.w600,fontFamily:"Avenir")
        ),
        value: checkbox.value,
        onChanged: (bool? value){
          setState(() {
            checkbox.value = value!;
            print(value);
          });
        });

  }
}
//
// class RoundIconButton extends StatelessWidget {
//   final IconData icon;
//   final Color? btnColor ;
//   final Color? btnTextColor;
//   void Function()? onPress;
//   final String? text;
//   RoundIconButton({Key? key,
//     required this.icon,
//     required this.onPress,
//     this.btnColor,
//     this.btnTextColor,
//     this.text,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       splashColor: Colors.black.withOpacity(0.1),
//       constraints: BoxConstraints.tightFor(
//         width: 56.0,
//         height: 56.0,
//       ),
//       elevation: 0,
//       // shape: CircleBorder(),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
//       fillColor: btnColor??Color(0xFF4C4F5E),
//       onPressed: onPress,
//       child: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(color:Colors.grey,width: 1.5),
//             color: Colors.white,
//           ),
//           padding: EdgeInsets.all(3),
//           child: Icon(icon,color: Colors.grey,)
//       ),
//     );
//   }}