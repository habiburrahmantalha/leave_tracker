import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:oktoast/oktoast.dart';

void printDebug(Object? object) {
  if(kDebugMode){
    print(object);
  }
}

void showCustomBottomSheet(BuildContext context,{
  required Widget child,
  bool isScrollControlled = true,
  bool isDismissible = true
}){
  showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      useSafeArea: true,
      enableDrag: true,
      showDragHandle: true,
      isDismissible: isDismissible,
      builder: (context){
        return SafeArea(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: child,
          ),
        );
      }
  );
}

showOkToast(String message, {ToastType type = ToastType.regular}){
  showToast(
      message,
      position: ToastPosition.bottom,
      duration: const Duration(seconds: 2),
      backgroundColor: switch(type){
        ToastType.regular => const Color(0xFF4D535A),
        ToastType.warning => const Color(0xffF06F27),
        ToastType.error => const Color(0xffE03B3B),
        ToastType.success => const Color(0xff2D884D),
      },
      textStyle: const TextStyle(color: Colors.white, fontSize: 14),
      textPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      dismissOtherToast: true
  );
}

