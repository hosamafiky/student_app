import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:student_app/constants/palette/palette.dart';
import 'package:student_app/presentation/features/admin/services/admin_services.dart';
import 'package:student_app/presentation/widgets/default_button.dart';
import 'package:student_app/presentation/widgets/default_textfield.dart';

import '../../../../constants/functions/functions.dart';

class AddCourseScreen extends StatefulWidget {
  static const routeName = '/add-course';
  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final typeController = TextEditingController();
  final _addCourseFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    typeController.dispose();
  }

  List<String> days = [
    'السبت',
    'الأحد',
    'الإثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
  ];

  final List<String> _selectedDays = [];

  File? image;

  void pickImage() async {
    var set = await pickFiles();
    setState(() {
      image = set;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryColor,
        appBar: AppBar(
          title: const Text(
            'إضافة دورة جديدة',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _addCourseFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.file(image!),
                        )
                      : InkWell(
                          onTap: () => pickImage(),
                          child: DottedBorder(
                            color: Colors.white,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10.0),
                            dashPattern: const [10.0, 4.0],
                            child: Container(
                              height: 150.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.folder_open, size: 40.0),
                                  SizedBox(height: 15.0),
                                  Text(
                                    'اختر صورة للدورة',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 30.0),
                  DefaultTextFormField(
                    controller: nameController,
                    hintText: 'اسم الدورة',
                  ),
                  const SizedBox(height: 10.0),
                  DefaultTextFormField(
                    controller: descriptionController,
                    hintText: 'وصف الدورة',
                    maxLines: 7,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultTextFormField(
                          controller: priceController,
                          hintText: 'سعر الدورة',
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: DefaultTextFormField(
                          controller: typeController,
                          hintText: 'نوع الطالب',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton(
                          underline: const SizedBox.shrink(),
                          hint: const Text('المواعيد المتاحة'),
                          items: days
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedDays.contains(value!)
                                  ? _selectedDays.remove(value)
                                  : _selectedDays.add(value);
                            });
                          },
                        ),
                      ),
                      Expanded(child: Text(_selectedDays.join(', '))),
                    ],
                  ),
                  DefaultButton(
                    text: 'انشر الدورة',
                    notSelected: true,
                    onTap: () {
                      if (_addCourseFormKey.currentState!.validate() &&
                          image != null) {
                        AdminServices().addCourse(
                          context: context,
                          name: nameController.text,
                          description: descriptionController.text,
                          price: priceController.text,
                          studentType: typeController.text,
                          appointments: _selectedDays,
                          image: image!,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
