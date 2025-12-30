// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../routes/app_pages.dart';

// class NetworkService extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//   bool isConnected = false;
//   StreamSubscription? _connectivitySubscription;
//   @override
//   void onInit() {
//     super.onInit();
//     _connectivitySubscription = _connectivity.onConnectivityChanged
//         .listen((List<ConnectivityResult> events) {
//       // Normalize the list to a single ConnectivityResult (first item or none).
//       final first = events.isNotEmpty ? events.first : ConnectivityResult.none;
//       _updateConnectionStatus(first);
//     });
//   }

//   @override
//   void onClose() {
//     _connectivitySubscription?.cancel();
//     super.onClose();
//   }

//   void _updateConnectionStatus(ConnectivityResult connectivityResult) {
//     if (connectivityResult != ConnectivityResult.none && isConnected == false) {
//       isConnected = true;
//       if (Get.context != null && Navigator.canPop(Get.context!)) {
//         Navigator.pop(Get.context!);
//       }
//     } else if (connectivityResult == ConnectivityResult.none &&
//         isConnected == true) {
//       isConnected = false;
//       if (Get.currentRoute != Routes.NOINTERNET) Get.toNamed(Routes.NOINTERNET);
//     }
//   }
// }
