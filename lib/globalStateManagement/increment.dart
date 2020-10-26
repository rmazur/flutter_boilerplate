import 'package:hooks_riverpod/hooks_riverpod.dart';

/* class Increment with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
} */

final increment = StateProvider<int>((ref) => 0);
