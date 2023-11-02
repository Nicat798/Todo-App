import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:notes_app_demo/helper/datetime_picker_language.dart';

Future<DateTime?> customTimePicker(
    BuildContext context, Function(DateTime selectedTime) onConfirm) {
  return DatePicker.showTimePicker(
    locale: TranslationHelper.getDeviceLangAndChangePickerLang(context),
    showSecondsColumn: false,
    context,
    onConfirm: (
      DateTime selectedTime,
    ) =>
        onConfirm(selectedTime),
  );
}
