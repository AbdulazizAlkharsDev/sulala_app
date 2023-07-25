import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sulala_app/src/theme/colors/colors.dart';
import 'package:sulala_app/src/theme/fonts/fonts.dart';

class FileUploaderField extends StatefulWidget {
  const FileUploaderField({Key? key}) : super(key: key);

  @override
  State<FileUploaderField> createState() => _FileUploaderFieldState();
}

class _FileUploaderFieldState extends State<FileUploaderField> {
  bool _fileSelected = false;
  bool _loading = false;
  String _fileName = "";

  Future<void> _chooseFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _fileSelected = true;
          _fileName = result.files.single.name!;
          _loading = false; // Reset loading state after file selection
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
      // TODO: Add error handling here
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _uploadFile(String filePath) async {
    // Set loading state to true when starting the upload process
    setState(() {
      _loading = true;
    });

    // Simulate file upload process (you should implement your upload logic here)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _loading = false;
    });
  }

  void _deleteFile() {
    setState(() {
      _fileSelected = false;
      _fileName = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _fileSelected
        ? AppColors.primary20
        : (Focus.of(context).hasFocus
            ? AppColors.primary20
            : AppColors.grayscale20);

    final suffixIcon = _loading
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary30),
          )
        : _fileSelected
            ? IconButton(
                icon: Icon(
                  Icons.delete,
                  color: AppColors.error100,
                ),
                onPressed: _deleteFile,
              )
            : Icon(
                Icons.attach_file,
                color: borderColor,
              );

    final fileWidget = _fileSelected
        ? Row(
            children: [
              Icon(
                Icons.attach_file,
                color: AppColors.primary30,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  _fileName,
                  style: AppFonts.body1(color: AppColors.grayscale90),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        : SizedBox(); // Show an empty container if no file is selected

    return ElevatedButton(
      onPressed: _loading ? null : _chooseFile, // Disable button during loading
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: 2.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          suffixIcon,
          SizedBox(width: 8),
          fileWidget,
        ],
      ),
    );
  }
}

// Add it in AndroidManifest.xml for Android
// <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />

// Add it in Info.plist for iOS
// <key>NSPhotoLibraryUsageDescription</key>
// <string>Allow access to your photo library to pick files.</string>
