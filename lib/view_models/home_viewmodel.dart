import 'package:flutter/material.dart';
import 'package:imove/models/delivery.dart';
import 'package:imove/view_models/history_viewmodel.dart';
import 'package:imove/view_models/user_viewmodel.dart';

class HomeViewmodel with ChangeNotifier {
  final UserViewmodel userViewModel;
  final HistoryViewmodel historyViewmodel;
  final List<DeliveryModel> _lastThreeDeliveries = [];
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  List<DeliveryModel> get lastThreeDeliveries => _lastThreeDeliveries;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void recentHistory() {
    // Get the deliveries from historyViewmodel
    List<DeliveryModel> unsortedDeliveries = historyViewmodel.deliveries;
    print(unsortedDeliveries.length);

    // Sort deliveries by date in descending order
    unsortedDeliveries.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    _lastThreeDeliveries.clear();

    // Take the first 3 or fewer deliveries
    _lastThreeDeliveries.addAll(
      unsortedDeliveries.take(3),
    );

    // Notify listeners of the change
    print("recent historydone");
    print(_lastThreeDeliveries);

    // notifyListeners();
  }

  HomeViewmodel(this.userViewModel, this.historyViewmodel);
}
