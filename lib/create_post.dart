import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  List<String> categories = ['Recent', 'Achievements', 'Events'];
  String selectedCategory = 'Recent';
  List<File> images = [];

  TextEditingController descriptionController = TextEditingController();
  TextEditingController hashtagsController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      resizeToAvoidBottomInset: false, 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text('Select Image(s)'),
              const SizedBox(height: 16.0),
              Center(
                child: SizedBox(
                  width: 400, 
                  child: SizedBox(
                    width:100,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return IconButton(
                            onPressed: _pickImage,
                            icon: const Icon(Icons.add),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            children: [
                              Image.file(
                                images[index - 1],
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      images.removeAt(index - 1);
                                    });
                                  },
                                  icon: const Icon(Icons.close),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: descriptionController,
                maxLines: null, 
                keyboardType: TextInputType.multiline, 
                decoration: const InputDecoration(
                  hintText: 'Add description',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), 
                ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: hashtagsController,
                decoration: const InputDecoration(
                  hintText: 'Add hashtags',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red), 
                ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _selectDate,
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today,color: Colors.red, ),
                        const SizedBox(width: 8.0),
                        Text(selectedDate == null
                            ? 'Select Date'
                            : selectedDate!.toString().split(' ')[0],
                             style: const TextStyle(color: Colors.white),
                            ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _selectTime,
                    child: Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.red, ),
                        const SizedBox(width: 8.0),
                        Text(selectedTime == null
                            ? 'Select Time'
                            : selectedTime!.format(context),
                             style: const TextStyle(color: Colors.white),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _uploadPost,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  child: const Text('Upload',style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Future<void> _pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    setState(() {
      images.add(File(pickedFile.path));
    });
  }
}

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _uploadPost() {
    String description = descriptionController.text;
    String hashtags = hashtagsController.text;

    print('Category: $selectedCategory');
    print('Description: $description');
    print('Hashtags: $hashtags');
    if (selectedDate != null) {
      print('Selected Date: $selectedDate');
    }
    if (selectedTime != null) {
      print('Selected Time: $selectedTime');
    }
    if (images.isNotEmpty) {
      print('Images:');
      for (var image in images) {
        print(image.path);
      }
    }

    _resetFields();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Post uploaded successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _resetFields() {
    setState(() {
      descriptionController.clear();
      hashtagsController.clear();
      selectedDate = null;
      selectedTime = null;
      images.clear();
    });
  }
}

void main() {
  runApp(const MaterialApp(
    home: CreatePostScreen(),
  ));
}
