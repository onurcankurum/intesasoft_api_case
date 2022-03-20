import 'package:flutter/material.dart';

class DrawerListTile extends StatefulWidget {
 final String title;
 final IconData icon; 
 const DrawerListTile({Key? key,required this.icon,required this.title}) : super(key: key);

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
     
      leading: Icon(widget.icon,color: Theme.of(context).primaryColorDark,),
      title:Text( widget.title,style: TextStyle(color: Theme.of(context).primaryColorDark),),
        style: ListTileStyle.list,
        focusColor: Colors.red,
         selectedColor: Colors.red,
         hoverColor: Colors.red,
         selectedTileColor: Colors.red,
         autofocus: true,
         onTap: (){},
    );
  }
}