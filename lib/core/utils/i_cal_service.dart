import 'dart:io';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/core/utils/utils.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:permission_handler/permission_handler.dart';


/// Request storage permission
Future<bool> requestManagePermission() async {
  final PermissionStatus status = await Permission.manageExternalStorage.request();
  return status.isGranted;
}


/// Save file
Future<void> saveICalFile(final String iCalContent, final String name) async {
  printDebug(iCalContent);
  // Request permission
  if ( await requestManagePermission()) {
    /// Get the downloads directory
    final Directory downloadsDirectory = Directory('/storage/emulated/0/Download');

    // Create the iCal file
    final String fileName = '$name.ics';
    final File file = File('${downloadsDirectory.path}/$fileName');

    // Write content to the file
    await file.writeAsString(iCalContent);

    printDebug('iCal file saved to: ${file.path}');
    showOkToast('iCal file saved to: ${file.path}', type: ToastType.success);

  } else {
    printDebug('Storage permission denied.');
    showOkToast('Storage permission denied.', type: ToastType.error);
  }
}

/// Function to generate iCal format for a single event
String generateICal(final Absence absence)  {
  // iCal format string
  final icalContent = '''
BEGIN:VCALENDAR
VERSION:2.0
PRODID:Absence Manager
BEGIN:VEVENT
UID:${DateTime.now().toIso8601String()}
DTSTAMP:${absence.startDate?.toYYMMdd()}T000000.000
DTSTART:${absence.startDate?.toYYMMdd()}T000000.000
DTEND:${absence.endDate?.toYYMMdd()}T235959.000
SUMMARY: Absent type - ${absence.type.value}
DESCRIPTION:Absent of ${absence.member?.name ?? ""}
LOCATION:Virtual
END:VEVENT
END:VCALENDAR
''';

  return icalContent;
}

///Create and save iCal file
Future<void> createAndSaveSingleDateAbsence(final Absence absence) async {
  final String iCalContent = generateICal(absence);
  saveICalFile(iCalContent, 'absence-${absence.type.value}-${absence.member?.name ?? ''}');
}