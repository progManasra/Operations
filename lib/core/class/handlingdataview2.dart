import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class HandlingDataView2 extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView2({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.offline, width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(AppImageAsset.server, width: 250, height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Lottie.asset(AppImageAsset.nodata, width: 250, height: 250))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.offline, width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(AppImageAsset.server, width: 250, height: 250))
                : widget;
  }
}
