import 'package:leave_tracker/core/resource/app_dimensions.dart';
import 'package:leave_tracker/core/resource/app_string.dart';
import 'package:leave_tracker/core/resource/app_colors.dart';

/// A utility class that provides access to application-wide resources.
class R {
  /// Instance of the application's color resources.
  static final color = AppColors();

  /// Instance of the application's string resources.
  static final string = AppStrings();

  /// Instance of the application's dimension resources.
  static final dimension = AppDimension();
}