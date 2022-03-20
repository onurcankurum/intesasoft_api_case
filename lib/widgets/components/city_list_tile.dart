import 'package:flutter/material.dart';

import '../../models/cities.dart';
import '../../utils/constants.dart';
import '../../views/city_detail.dart';


class CityListTile extends StatefulWidget {
  final CitiesModel model;
  const CityListTile({Key? key, required this.model}) : super(key: key);

  @override
  State<CityListTile> createState() => _CityListTileState();
}

class _CityListTileState extends State<CityListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.model.image == null
                ? Constants.noImgUrl
                : widget.model.image!,
            fit: BoxFit.cover,
            height: 80,
            width: 80,
          ),
        ),
        subtitle:
            Text("Güncel Nüfus: ${widget.model.populations!.first.population}"),
        title: Text(widget.model.name),
        trailing: const Icon(Icons.remove_red_eye_outlined),
        style: ListTileStyle.list,
        focusColor: Colors.red,
        selectedColor: Colors.red,
        hoverColor: Colors.red,
        autofocus: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CityDetailed(
                      cityId: widget.model.id,
                    )),
          );
        },
      ),
    );
  }
}
