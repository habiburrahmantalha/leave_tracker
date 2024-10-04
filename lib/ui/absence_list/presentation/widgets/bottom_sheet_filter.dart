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
    notifierFilter = ValueNotifier(widget.selectedFilter ?? AbsenceFilter());
  }
  // Method to open date range picker
  Future<void> _selectDateRange(BuildContext context, DateTimeRange? selectedDateRange, ValueChanged<DateTimeRange> onSelect) async {
    DateTimeRange? pickedRange = await showDateRangePicker(
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
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifierFilter,
        builder: (context, notifierValue, child){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Keep bottom sheet height minimal
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Filter", style: Theme.of(context).textTheme.headlineSmall),
                    RawButton(
                        padding: EdgeInsets.all(8),
                        child: Text("Reset", style: Theme.of(context).textTheme.titleMedium),
                        onTap: (){
                          notifierFilter.value = AbsenceFilter();
                        })
                  ],
                ),
                Divider(height: 24,),
                // Absence Type Dropdown
                Text("Absence Type", style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<AbsenceType>(
                  value: notifierValue.type,
                  hint: Text("Select Absence Type"),
                  onChanged: (value) {
                    notifierFilter.value = notifierValue.copyWith(type: value);
                  },
                  items: AbsenceType.values.map((AbsenceType type) {
                    return DropdownMenuItem<AbsenceType>(
                      value: type,
                      child: Text(type.title),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16.0),

                // Absence Status Dropdown
                Text("Absence Status", style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<AbsenceStatus>(
                  value: notifierValue.status,
                  hint: Text("Select Status"),
                  onChanged: (value) {
                    notifierFilter.value = notifierValue.copyWith(status: value);
                  },
                  items: AbsenceStatus.values.map((AbsenceStatus status) {
                    return DropdownMenuItem<AbsenceStatus>(
                      value: status,
                      child: Text(status.title),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16.0),

                // Date Range Picker
                Text("Select Date Range", style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 8.0),
                InkWell(
                  onTap: () => _selectDateRange(context, notifierValue.dateTimeRange, (DateTimeRange value){
                    notifierFilter.value = notifierValue.copyWith(dateTimeRange: value);
                  } ),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Pick a date range",
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notifierValue.dateTimeRange == null
                              ? "Start Date - End Date"
                              : "${notifierValue.dateTimeRange!.start.toddMMMyy()} - ${notifierValue.dateTimeRange!.end.toddMMMyy()}",
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24.0),

                RawButton(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Apply Filters", style: Theme.of(context).textTheme.titleMedium),
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


