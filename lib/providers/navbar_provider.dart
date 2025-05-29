import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavbarProvider extends StateNotifier<int> {
  NavbarProvider() : super(0);

  void changeIndex(int index) {
    state = index;
  }
}

final navbarProvider = StateNotifierProvider<NavbarProvider, int>(
  (ref) => NavbarProvider(),
);
