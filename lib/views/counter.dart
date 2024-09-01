import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterView extends HookWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final numbers = useState<List<int>>([]);
    final names = useState<Map<String, String>>({});
    return Scaffold(
      appBar: AppBar(
        title: Text(names.value['flutter'] ?? ''),
        actions: [
          IconButton(
            onPressed: () {
              final map = {...names.value};
              map['flutter'] = 'flutter 3.x';
              names.value = map;
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(title: Text('${numbers.value[index]}'));
            },
            itemCount: numbers.value.length),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final list = [...numbers.value];
          list.add(numbers.value.length + 1);
          numbers.value = list;
        },
      ),
    );
  }
}
