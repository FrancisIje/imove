import 'package:imove/view_models/basedelivery_viewmodel.dart';
import 'package:imove/view_models/location_viewmodel.dart';
import 'package:imove/views/widgets/error_toast.dart';

class ScheduleDeliveryViewModel extends BaseDeliveryViewModel {
  DateTime? _deliveryDate;

  ScheduleDeliveryViewModel({required LocationViewmodel locationViewModel})
      : super(locationViewModel: locationViewModel);

  DateTime? get deliveryDate => _deliveryDate;

  set setDeliveryDate(DateTime deliveryTime) {
    _deliveryDate = deliveryTime;
    notifyListeners();
  }

  Future<bool> placeScheduledOrder() async {
    if (_deliveryDate == null) {
      errorToast("Delivery date not set");
      return false;
    }
    return await placeOrder(deliveryDate: _deliveryDate!);
  }
}
