import 'package:flutter/material.dart';

class ProductCardOrder extends StatefulWidget {
  @override
  _ProductCardOrderState createState() => _ProductCardOrderState();
}

class _ProductCardOrderState extends State<ProductCardOrder> {
  @override
  Widget build(BuildContext context) {
    return Card(        
        margin: EdgeInsets.fromLTRB(10, 8.0, 10, 8.0),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Text("2X"),
                Container(width: 10,),
                Text("Item",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold )),
                Spacer(),
                Text("26Bs.",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold )),
                Icon(Icons.star,size: 40,color: Colors.orange,)
              ],
          ),
          )
        ),
        );
  }
}
