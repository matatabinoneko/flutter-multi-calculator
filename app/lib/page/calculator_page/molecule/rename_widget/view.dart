import 'package:calculator/static/size.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RenameWidget extends StatelessWidget {
  final Function setName;
  final String name;
  String newName = "";

  RenameWidget({Key? key, required this.setName, required this.name})
      : super(key: key);

  Future<void> inputDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('名前変更'),
            content: TextField(
                decoration: const InputDecoration(hintText: "ここに入力してください"),
                controller: TextEditingController(text: name),
                onChanged: (String _newName) {
                  newName = _newName;
                }),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('キャンセル'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  setName(newName);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return InkWell(
      child: SizedBox(
        width: sizeConfig.calculatorNameTextWidth,
        child: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      onTap: () {
        inputDialog(context);
      },
    );
  }
}
