import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterView extends HookWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final numbers = useState<List<int>>([]);
    final counter = useValueNotifier<int>(0); //! caso queria ouvir mudanças em lugares pecificos

    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
            valueListenable: counter,
            builder: (context, value, _) {
              return Text(value.toString());
            }),
        actions: [
          IconButton(
            onPressed: () {
              counter.value++;
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: numbers.value.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${numbers.value[index]}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final list = [...numbers.value];
          list.add(list.length + 1);
          numbers.value = list;
        },
      ),
    );
  }
}
