import 'dart:math';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  int typeList = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlineButton(
                child: Text('ListView'),
                onPressed: () {
                  setState(() {
                    typeList = 1;
                  });
                },
              ),
              OutlineButton(
                child: Text('ListView.builer'),
                onPressed: () {
                  setState(() {
                    typeList = 2;
                  });
                },
              ),
              OutlineButton(
                child: Text('ListView.separeted'),
                onPressed: () {
                  setState(() {
                    typeList = 3;
                  });
                },
              )
            ],
          ),
          Expanded(child: _main()),
        ],
      ),
    );
  }

  Widget _main() {
    switch (typeList) {
      case 1:
        return defaultList();
      case 2:
        return builderList();
      case 3:
        return separatedList();
      default:
        defaultList();
    }
  }

  Widget separatedList() {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (ctx, index) {
        return RandomColoredBox('separated list', item: index);
      },
      separatorBuilder: (ctx, index) {
        return Divider(
          thickness: 2,
          color: Colors.black,
          // height: 3,
        );
        // return Text('separando os widgets');
      },
    );
  }

  Widget builderList() {
    var listaAPI = <String>[
      'item 1',
      'item 2',
    ];
    return ListView.builder(
      // itemCount: listaAPI.length,
      itemCount: 20,
      // itemBuilder: (ctx, index) {
      //   var item = listaAPI[index];
      //   return Text('item $item');
      // },
      itemBuilder: (ctx, index) {
        return RandomColoredBox('builder list', item: index);
      },
    );
  }

  Widget defaultList() {
    var listaAPI = <String>[
      'item 1',
      'item 2',
    ];
    return ListView(
      padding: EdgeInsets.all(20),
      // reverse: true,
      // children: listaAPI.map((item) {
      //   return Text(item);
      // }).toList(),
      children: [
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
        RandomColoredBox('list default'),
      ],
    );
  }
}

class RandomColoredBox extends StatefulWidget {
  final int item;
  final String text;
  RandomColoredBox(this.text, {this.item});
  @override
  _RandomColoredBoxState createState() => _RandomColoredBoxState();
}

class _RandomColoredBoxState extends State<RandomColoredBox> {
  @override
  void initState() {
    super.initState();
    print('initState ${widget.item ?? -1}');
  }

  @override
  void dispose() {
    print('dispose ${widget.item ?? -1}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int random = widget.item;

    if (random == null || random > Colors.primaries.length - 1) {
      random = Random.secure().nextInt(Colors.primaries.length);
    }

    return Container(
      height: 60,
      child: ColoredBox(
        color: Colors.primaries[random],
        child: Text(
          'Random Colored ${widget.text}',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
