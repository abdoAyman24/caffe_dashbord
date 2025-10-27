import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppImagePicker extends StatefulWidget {
  const AppImagePicker({super.key, required this.file});
  final ValueChanged file;
  @override
  State<AppImagePicker> createState() => _AppImagePickerState();
}

class _AppImagePickerState extends State<AppImagePicker> {
  final ImagePicker picker = ImagePicker();
  File? _imageFile;
  bool isLoad = false;

  Future<void> pickImage(BuildContext context) async {
    // نعرض للمستخدم حوار لاختيار المصدر
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اختر مصدر الصورة'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: const Text('📸 الكاميرا'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: const Text('🖼️ المعرض'),
          ),
        ],
      ),
    );

    if (source != null) {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
        });
      } else {
        log('image is ont picked ');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          isLoad = true;
        });
        await pickImage(context);

        setState(() {
          isLoad = false;
          log('$_imageFile');
          print('$_imageFile');
          widget.file(_imageFile);
        });
      },
      child: Skeletonizer(
        enabled: isLoad,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 44, 43, 43),
            borderRadius: BorderRadius.circular(12),
            border: BoxBorder.all(
              color: const Color.fromARGB(255, 193, 192, 192),
              width: 2,
            ),
            image: _imageFile != null
                ? DecorationImage(
                    image: FileImage(File(_imageFile!.path)),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: _imageFile != null
              ? Align(
                  alignment: AlignmentGeometry.directional(-0.9, -0.9),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _imageFile = null;
                      });
                    },
                    child: Icon(
                      Icons.delete_rounded,
                      color: Colors.red,
                      size: 35,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
