import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class Draft extends StatefulWidget {
  const Draft({Key? key}) : super(key: key);

  @override
  State<Draft> createState() => _DraftState();
}

class _DraftState extends State<Draft> {
  final List<String> _uploadedFiles = [];
  bool _loading = false;
  double _uploadProgress = 0.0;

  Future<void> _chooseFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        // Add the uploaded file name to the list
        setState(() {
          _uploadedFiles.add(result.files.single.name);
          _loading = false;
        });

        // Start uploading the file
        await _uploadFile(result.files.single.path!);
      } else {
        // User canceled file selection
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      // Handle any potential errors when picking the file
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _uploadFile(String filePath) async {
    // Set loading state to true when starting the upload process
    setState(() {
      _loading = true;
      _uploadProgress = 0.0;
    });

    // Simulate file upload process (you should implement your upload logic here)
    for (int i = 0; i <= 100; i += 10) {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        _uploadProgress = i / 100;
      });
    }

    // Set the loading state to false after the upload is complete
    setState(() {
      _loading = false;
    });
  }

  void _deleteFile(String fileName) {
    // Remove the file from the list
    setState(() {
      _uploadedFiles.remove(fileName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderColor =
        _uploadedFiles.isNotEmpty ? AppColors.primary20 : AppColors.grayscale20;

    final uploadButton = ElevatedButton(
      onPressed: _loading ? null : _chooseFile,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.grayscale0,
        elevation: 0,
        padding: const EdgeInsets.all(0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(16),
            color: borderColor,
            strokeWidth: 1,
            dashPattern: const [12, 12],
            child: SizedBox(
              width: constraints.maxWidth,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.file_copy_outlined,
                      color: AppColors.grayscale50,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Upload file",
                      style: AppFonts.body1(color: AppColors.grayscale50),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

    return Column(
      children: [
        uploadButton,
        const SizedBox(
          height: 16,
        ),
        // Use ListView.builder to create a list of uploaded files
        ListView.builder(
          shrinkWrap: true,
          itemCount: _uploadedFiles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.file_copy_outlined,
                    color: AppColors.primary30,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _uploadedFiles[index],
                      style: AppFonts.body1(color: AppColors.grayscale90),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (_loading)
                    Expanded(
                      child: LinearProgressIndicator(
                        value: _uploadProgress,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary30,
                        ),
                        backgroundColor: AppColors.grayscale10,
                      ),
                    ),
                  IconButton(
                    onPressed: () => _deleteFile(_uploadedFiles[index]),
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppColors.error100,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
