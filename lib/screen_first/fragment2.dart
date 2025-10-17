import 'package:flutter/material.dart';
import 'fragment3.dart';

class Fragment2 extends StatefulWidget {
  const Fragment2({super.key});

  @override
  _Fragment2State createState() => _Fragment2State();
}

class _Fragment2State extends State<Fragment2> {
  List<String> items = ['Unit A', 'Unit B', 'Unit C'];

  void addItem() {
    setState(() {
      items.add('Unit ${String.fromCharCode(65 + items.length)}');
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void navigateNext() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Fragment3()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView')),
      body: ListView(
        children: items.asMap().entries.map((entry) {
          int idx = entry.key;
          String val = entry.value;
          return ListTile(
            key: ValueKey(val),
            title: Text(val),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removeItem(idx),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add2',
            onPressed: addItem,
            tooltip: "Add item",
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton.extended(
            label: const Text('ListView.separated'),
            icon: const Icon(Icons.view_module),
            onPressed: navigateNext,
            heroTag: 'nav2',
          ),
        ],
      ),
    );
  }
}
