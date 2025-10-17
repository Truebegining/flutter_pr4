import 'package:flutter/material.dart';

class Fragment3 extends StatefulWidget {
  const Fragment3({super.key});

  @override
  _Fragment3State createState() => _Fragment3State();
}

class _Fragment3State extends State<Fragment3> {
  List<String> items = ['Unit 1', 'Unit 2', 'Unit 3.'];

  void addItem() {
    setState(() {
      items.add('Unit ${items.length + 1}');
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.separated')),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final val = items[index];
          return ListTile(
            key: ValueKey(val),
            title: Text(val),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => removeItem(index),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add3',
            onPressed: addItem,
            tooltip: 'Add item',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
