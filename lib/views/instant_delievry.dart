import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:imove/services/map/map.dart';

import 'package:imove/utiils/utils.dart';
import 'package:imove/view_models/instant_delivery_viewmodel.dart';
import 'package:imove/views/widgets/error_toast.dart';
import 'package:provider/provider.dart';
// import 'package:imove/view_models/location_viewmodel.dart';
// import 'package:imove/views/delivery_details.dart';
// import 'package:provider/provider.dart';

class InstantDelievryScreen extends StatelessWidget {
  const InstantDelievryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // late GoogleMapController mapController;
    // final locationProv = Provider.of<LocationViewmodel>(context);
    final viewModel = Provider.of<InstantDeliveryViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // GoogleMap(
          //   polylines: Provider.of<MapApi>(context).polylineSet,
          //   initialCameraPosition: const CameraPosition(
          //     target: LatLng(0, 0),
          //     zoom: 1,
          //   ),
          //   myLocationButtonEnabled: true,
          //   onMapCreated: (controller) {
          //     mapController = controller;
          //     MapApi().onMapCreated(mapController, locationProv);
          //   },
          //   myLocationEnabled: true,
          //   compassEnabled: false,
          //   markers: Provider.of<MapApi>(context).geoMarkers,
          //   onTap: (argument) {
          //     // _addMarker(argument);
          //   },
          // ),
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/location.png",
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Instant Delivery",
                      style: AppTypography.avenir().h6,
                    ),
                    Gap(8.h),
                    Text(
                      "Pickup Location",
                      style: AppTypography.avenir().bodySmallM,
                    ),
                    Gap(8.h),
                    TextField(
                      controller: viewModel.controllers[0],
                      decoration: InputDecoration(
                        hintText: "89 Opebi Rd, Ikeja, Lagos, Nigeria",
                        hintStyle: AppTypography.avenir()
                            .bodySmallSB
                            .copyWith(color: Colors.black45),
                        enabled: true,
                        fillColor: AppColors.textFieldBackgroundColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    Gap(24.h),
                    Text(
                      "Delivery Location",
                      style: AppTypography.avenir().bodySmallM,
                    ),
                    Gap(8.h),
                    TextField(
                      controller: viewModel.controllers[1],
                      decoration: InputDecoration(
                        hintStyle: AppTypography.avenir()
                            .bodySmallSB
                            .copyWith(color: Colors.black45),
                        hintText: "89 Opebi Rd, Ikeja, Lagos, Nigeria",
                        enabled: true,
                        fillColor: AppColors.textFieldBackgroundColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide.none),
                      ),
                    ),
                    const AspectRatio(aspectRatio: 5),
                    ElevatedButton(
                        onPressed: () {
                          if (viewModel.controllers[0].text.isEmpty ||
                              viewModel.controllers[1].text.isEmpty) {
                            errorToast("Input both fields");
                          } else {
                            context.push("/add-details/instant");
                          }
                        },
                        child: const Text(
                          "Next",
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
