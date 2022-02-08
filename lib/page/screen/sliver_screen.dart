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
  double price = 2.20;

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
            floating: true,
            leading: TextButton(
              child: Icon(Icons.close,color: Colors.white,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: kCustomButton,
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  "https://images.unsplash.com/photo-1603785608232-44c43cdc0d70?ixlib=rb-1.2.1&"
                      "ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&"
                      "fit=crop&w=500&q=60",
                  fit: BoxFit.cover),
            ),
          ),

          SliverFillRemaining(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
                              countContainer(icon: Icons.add,onTap: increment),
                              Text("${count}",style: TextStyle(fontSize: 17,color: Colors.blue,fontWeight: FontWeight.bold)),
                              countContainer(icon: Icons.add,onTap: decrement),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
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
                              Text("${count*price} BHd",style: TextStyle(fontSize: 17.5,color: Colors.white,fontWeight: FontWeight.w500,fontFamily:"Avenir")),
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
  Widget countContainer({void Function()? onTap,required IconData icon}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.all(0.2),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 2),
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(child: Icon(icon,size: 14,color: Colors.grey,)),
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

