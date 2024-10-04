import 'package:flutter/material.dart';
import 'package:leave_tracker/core/constants/enums.dart';
import 'package:leave_tracker/core/utils/extensions.dart';
import 'package:leave_tracker/ui/absence_list/domain/entities/absence_filter.dart';
import 'package:leave_tracker/widgets/raw_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, this.selectedFilter, required this.onComplete});

  final ValueChanged<AbsenceFilter> onComplete;
  final AbsenceFilter? selectedFilter;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {

  late ValueNotifier<AbsenceFilter> notifierFilter;

  @override
  void initState() {
    super.initState();
    notifierFilter = ValueNotifier(widget.selectedFilter ?? const AbsenceFilter());
  }
  // Method to open date range picker
  Future<void> _selectDateRange(final BuildContext context, final DateTimeRange? selectedDateRange, final ValueChanged<DateTimeRange> onSelect) async {
    final DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      currentDate: DateTime(2021),
      initialDateRange: selectedDateRange,
    );

    if (pickedRange != null) {
      onSelect(pickedRange);
    }
  }

  // Build method for BottomSheet UI
  @override
  Widget build(final BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifierFilter,
        builder: (final context, final notifierValue, final child){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Keep bottom sheet height minimal
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Filter', style: Theme.of(context).textTheme.headlineSmall),
                    RawButton(
                        padding: const EdgeInsets.all(8),
                        child: Text('Reset', style: Theme.of(context).textTheme.titleMedium),
                        onTap: (){
                          notifierFilter.value = const AbsenceFilter();
                        })
                  ],
                ),
                const Divider(height: 24,),
                // Absence Type Dropdown
                Text('Absence Type', style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<AbsenceType>(
                  value: notifierValue.type,
                  hint: const Text('Select Absence Type'),
                  onChanged: (final value) {
                    notifierFilter.value = notifierValue.copyWith(type: value);
                  },
                  items: AbsenceType.values.map((final AbsenceType type) {
                    return DropdownMenuItem<AbsenceType>(
                      value: type,
                      child: Text(type.title),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16.0),

                // Absence Status Dropdown
                Text('Absence Status', style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<AbsenceStatus>(
                  value: notifierValue.status,
                  hint: const Text('Select Status'),
                  onChanged: (final value) {
                    notifierFilter.value = notifierValue.copyWith(status: value);
                  },
                  items: AbsenceStatus.values.map((final AbsenceStatus status) {
                    return DropdownMenuItem<AbsenceStatus>(
                      value: status,
                      child: Text(status.title),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16.0),

                // Date Range Picker
                Text('Select Date Range', style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 8.0),
                InkWell(
                  onTap: () => _selectDateRange(context, notifierValue.dateTimeRange, (final DateTimeRange value){
                    notifierFilter.value = notifierValue.copyWith(dateTimeRange: value);
                  } ),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Pick a date range',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notifierValue.dateTimeRange == null
                              ? 'Start Date - End Date'
                              : '${notifierValue.dateTimeRange!.start.toddMMMyy()} - ${notifierValue.dateTimeRange!.end.toddMMMyy()}',
                        ),
                        const Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24.0),

                RawButton(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Apply Filters', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    onTap: (){
                      widget.onComplete(notifierValue);
                    }),
                const SizedBox(height: 24.0),
              ],
            ),
          );
        });
  }
}


