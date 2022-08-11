import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:property_management_system/core/componets/components.dart';

class SearshScreen extends StatefulWidget {
  SearshScreen({Key? key}) : super(key: key);

  @override
  State<SearshScreen> createState() => _SearshScreenState();
}

class _SearshScreenState extends State<SearshScreen> {
  var SearshController = TextEditingController();

  var isSelected = true;

  var isSelected1 = true;

  var isSelected2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Mytextform(
            lable: "Find Rent,Seal",
            obscur: false,
            prefixe: Icon(Icons.search),
            valedat: () {},
            controllerr: SearshController,
            typ: TextInputType.text),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "proerty Type",
            style: TextStyle(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Container(
                width: 110.0,
                child: ChoiceChip(
                  label: Text("Residentail"),
                  selected: isSelected,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  backgroundColor: Colors.black12,
                  onSelected: (selected) {
                    setState(() {
                      isSelected = selected;
                    });
                  },
                  selectedColor: Colors.blue,
                ),
              ),
              const Spacer(),
              Container(
                width: 110.0,
                child: ChoiceChip(
                  label: Text("commerical"),
                  selected: isSelected1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  backgroundColor: Colors.black12,
                  onSelected: (selected) {
                    setState(() {
                      isSelected1 = selected;
                    });
                  },
                  selectedColor: Colors.blue,
                ),
              ),
              Spacer(),
              Container(
                width: 110.0,
                child: ChoiceChip(
                  label: Text("industrail"),
                  selected: isSelected2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  backgroundColor: Colors.black12,
                  onSelected: (selected) {
                    setState(() {
                      isSelected2 = selected;
                    });
                  },
                  selectedColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        Mytextform(
            lable: "Searsh Properties",
            obscur: false,
            prefixe: Icon(Icons.search),
            valedat: () {},
            controllerr: SearshController,
            typ: TextInputType.text),
        SizedBox(
          height: 20.0,
        ),
        Mytextform(
            lable: "Zip code ,Location , country or City ",
            obscur: false,
            prefixe: Icon(Icons.search),
            valedat: () {},
            controllerr: SearshController,
            typ: TextInputType.text),
        SizedBox(
          height: 20.0,
        ),
        newbutton(
            function: () {},
            height: 50.0,
            text: "Searsh",
            width: double.infinity,
            color: Colors.white,
            colortext: Colors.blue,
            colorRaduis: Colors.blue)
      ],
    ));
  }
}
