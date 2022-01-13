import 'package:flutter/material.dart';
import 'package:flutter_auth/Model/ItemDto.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_auth/components/alert.dart';
//Interface pour afficher les détails d'un Item
class ItemDetailsPage extends StatelessWidget {

  final ItemDto item;

  ItemDetailsPage({this.item});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  String selectedValue;
  List<String> items = [
    'iphone 8',
  ];
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              //Alerte qui s'affiche pour choisir l'un de ses propres Items pour l'échanger avec l'Item choisi ( d'un utilisateur)
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Please select from your own items',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                SizedBox(
                  height: 4,
                ),
                      Text(
                        'to trade',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [

                                  Icon(
                                    Icons.list,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ),
                                ],
                              ),
                              items: items
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 50,
                              buttonWidth: 160,
                              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Color(0xFF50C2C9),
                                ),
                                color: Color(0xFF50C2C9),
                              ),
                              buttonElevation: 2,
                              itemHeight: 40,
                              itemWidth: 200,
                              itemPadding: const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                              ],

                      )
                    ],
                  )),
              title: Text('Own Item Choose'),
              actions: <Widget>[
                InkWell(
                  child: Text('OK   '),
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      showDialog(context: context,
                          builder: (BuildContext context) {
                            return TradeSuccessAlert();
                          });
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Ordinateur Portable',
      'label': 'Ordinateur Portable',
      'icon': Icon(Icons.grade),
    },
    {
      'value': 'Iphone 7 plus',
      'label': 'Iphone 7 plus',
      'icon': Icon(Icons.grade),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item details'),
        backgroundColor: Color(0xFF6200EE)
      ),
      body:
      Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
      children: [
      ListTile(
      leading: Icon(Icons.arrow_drop_down_circle),
      title:  Text(item.title),
      subtitle: Text(
      item.shortDescription,
      style: TextStyle(color: Colors.black.withOpacity(0.6)),
      ),
      ),
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
      item.description,
      style: TextStyle(color: Colors.black.withOpacity(0.6)),
    ),
    ),
    ButtonBar(
    alignment: MainAxisAlignment.start,
    children: [
    FlatButton(
    textColor: const Color(0xFF6200EE),
    onPressed: () {
    // Perform some action
    },
    child: const Text('                      '),
    ),
    FlatButton(
    textColor: const Color(0xFF6200EE),
    onPressed:() async {
      //OnClick sur cette bouton, afficher l'alerte pour choisir un de ses propres items pour l'échange
      await showInformationDialog(context);
    },
    child: const Text('Trade this item'),
    ),
    ],
    ),
        CircleAvatar(
          backgroundImage: MemoryImage(item.itemImage),
          radius: 150,
        ),
    ],

      ),
    ));}}
