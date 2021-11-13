import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const kElementor = [
    Icon(
      Icons.star,
      size: 50.0,
    ),
    Icon(
      Icons.star,
      size: 100.0,
    ),
    Icon(
      Icons.star,
      size: 50.0,
    ),
  ];

  bool _isRow = true;

  MainAxisSize _mainAxisSize = MainAxisSize.max;
  final MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  final CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(),
      bottomNavigationBar: _appBarButton(),
    );
  }

  Widget _buildBody() {
    return Container(
        color: Colors.yellow,
        child: _isRow
            ? Row(
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                mainAxisSize: _mainAxisSize,
                children: kElementor,
              )
            : Column(
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                mainAxisSize: _mainAxisSize,
                children: kElementor,
              ));
  }

  Widget _appBarButton() {
    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Radio(
                  value: true,
                  groupValue: this._isRow,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        _isRow = value;
                      });
                    }
                  }),
              const Text("Radio 1"),
              Row(
                children: [
                  Radio(
                      value: false,
                      groupValue: this._isRow,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            _isRow = value;
                          });
                        }
                      }),
                  const Text("Radio 2")
                ],
              )
            ],
          ),
          ListTile(
              title: const Text("MainAxisAlignment"),
              trailing: DropdownButton<MainAxisSize>(
                value: _mainAxisSize,
                onChanged: (MainAxisSize? newVal) {
                  if (newVal != null) {
                    setState(() {
                      this._mainAxisSize = newVal;
                    });
                  }
                },
                items: MainAxisSize.values
                    .map(
                      (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                              e.toString().substring('MainAxisSize.'.length))),
                    )
                    .toList(),
              ))
        ],
      ),
    );
  }
}
