import 'package:imove/models/delivery.dart';

abstract class DeliveriesProvider {
  Future<List<DeliveryModel>> allUserDeliveries({required String id});
  Future<void> createDelivery({required DeliveryModel delivery});
}
