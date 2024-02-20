import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

class customBottomSheet extends StatefulWidget {
  const customBottomSheet({
    super.key,
  });

  @override
  State<customBottomSheet> createState() => _customBottomSheetState();
}

final formKey = GlobalKey<FormState>();

class _customBottomSheetState extends State<customBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field is required';
                }
              },
              prefixIcon: Icons.title,
              hintText: 'Task Title',
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field is required';
                }
              },
              prefixIcon: Icons.timelapse,
              hintText: 'Task Time',
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'this field is required';
                }
              },
              prefixIcon: Icons.date_range,
              hintText: 'Task Date',
            ),
          ],
        ),
      ),
    );
  }
}
