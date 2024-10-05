import 'dart:io';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/utils/utils.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


/// Request storage permission
Future<bool> requestStoragePermission() async {
  final status = await Permission.storage.request();
  return status.isGranted;
}

/// Save file
Future<void> saveICalFile(final String icalContent, final String name) async {
  // Request permission
  if (await requestStoragePermission()) {
    // Get the downloads directory
    Directory? downloadsDirectory;
    if (Platform.isAndroid) {
      downloadsDirectory = Directory('/storage/emulated/0/Download');
    } else {
      // iOS or other platforms, specify a fallback if needed
      downloadsDirectory = await getApplicationDocumentsDirectory();
    }

    // Create the iCal file
    final String fileName = '$name.ics';
    final File file = File('${downloadsDirectory.path}/$fileName');

    // Write content to the file
    await file.writeAsString(icalContent);
    printDebug('iCal file saved to: ${file.path}');
    showOkToast('iCal file saved to: ${file.path}', type: ToastType.success);
  } else {
    printDebug('Storage permission denied.');
    showOkToast('Storage permission denied.', type: ToastType.error);
  }
}

/// Function to generate iCal format for a single event
Future<String> generateICal(final Absence absence) async {
  // iCal format string
  final icalContent = '''
BEGIN:VCALENDAR
VERSION:2.0
PRODID:Absence Manager
BEGIN:VEVENT
UID:${DateTime.now().toIso8601String()}
DTSTAMP:${absence.startDate?.toUtc().toIso8601String().replaceAll(':', '').replaceAll('-', '')}
DTSTART:${absence.startDate?.toUtc().toIso8601String().replaceAll(':', '').replaceAll('-', '')}
DTEND:${(absence.endDate ?? absence.startDate)?.add(const Duration(days: 1)).toUtc().toIso8601String().replaceAll(':', '').replaceAll('-', '')}
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
  final String iCalContent = await generateICal(absence);
  saveICalFile(iCalContent, 'absence-${absence.type.value}-${absence.member?.name ?? ''}');
}