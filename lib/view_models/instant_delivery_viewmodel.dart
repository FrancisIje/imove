import 'package:imove/view_models/basedelivery_viewmodel.dart';
import 'package:imove/view_models/location_viewmodel.dart';

class InstantDeliveryViewModel extends BaseDeliveryViewModel {
  final DateTime deliveryDate = DateTime.now();
  InstantDeliveryViewModel({
    required LocationViewmodel locationViewModel,
  }) : super(locationViewModel: locationViewModel);

  Future<bool> placeInstantOrder() async {
    return await placeOrder(deliveryDate: deliveryDate);
  }
}
