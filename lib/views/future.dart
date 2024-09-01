import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FutureView extends HookWidget {
  const FutureView({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = useState(0);
    final future = useMemoized(() => Future.delayed(const Duration(seconds: 2)), [ref.value]);

    final snapshot = useFuture(future);
    return Scaffold(
      body: Center(
        child: snapshot.connectionState == ConnectionState.waiting ? const CircularProgressIndicator.adaptive() : const Text('Hello'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.value++;
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
