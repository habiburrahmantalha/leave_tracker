import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:oktoast/oktoast.dart';

/// Function for debug print which only print log in debug mode
void printDebug(final Object? object) {
  if(kDebugMode){
    print(object);
  }
}

///Function to bottom sheet
void showCustomBottomSheet(final BuildContext context,{
  required final Widget child,
  final bool isScrollControlled = true,
  final bool isDismissible = true,
}){
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: isScrollControlled,
      useSafeArea: true,
      showDragHandle: true,
      isDismissible: isDismissible,
      builder: (final context){
        return SafeArea(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: child,
          ),
        );
      },
  );
}

/// function for okToast
void showOkToast(final String message, {final ToastType type = ToastType.regular}){
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
      dismissOtherToast: true,
  );
}

