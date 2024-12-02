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
    List<DeliveryModel> unsortedDeliveries = historyViewmodel.deliveries;

    unsortedDeliveries.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    if (unsortedDeliveries.length < 3) {
      for (var i = 0; i < unsortedDeliveries.length; i++) {
        _lastThreeDeliveries.add(unsortedDeliveries[i]);
      }
    } else {
      for (var i = 0; i < 3; i++) {
        _lastThreeDeliveries.add(unsortedDeliveries[i]);
      }
    }

    notifyListeners();
  }

  HomeViewmodel(this.userViewModel, this.historyViewmodel);
}
