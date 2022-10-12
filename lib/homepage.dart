import 'package:flutter/material.dart';
import 'package:list_search/provider_class.dart';
import 'package:provider/provider.dart';

import 'country_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: name,
              onChanged: (value) {
                Provider.of<CountryProvider>(context, listen: false)
                    .changeSearchString(value);
              },
            ),
          ),
          Expanded(
            child: Consumer<CountryProvider>(
              builder: (context, value, child) {
                print("Consumer");
                return ListView.builder(
                  itemCount: (name.text.isEmpty)
                      ? value.list.length
                      : value.searchedList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: (name.text.isEmpty)
                            ? Text(value.list[index].name)
                            : Text(value.searchedList[index].name),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
