import 'package:flutter/material.dart';
import 'package:sulala_app/test/complete_info.dart';

class SelectedOptionsPage extends StatefulWidget {
  final String selectedAnimalType;
  final String selectedAnimalSpecies;
  final String selectedAnimalBreed;

  const SelectedOptionsPage({
    super.key,
    required this.selectedAnimalType,
    required this.selectedAnimalSpecies,
    required this.selectedAnimalBreed,
  });

  @override
  State<SelectedOptionsPage> createState() => _SelectedOptionsPageState();
}

class _SelectedOptionsPageState extends State<SelectedOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Animal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () {
              // Handle close button press
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Chosen Options',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You Can Apply Changes',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Text(
                    'Animal Type',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Text(
                    widget.selectedAnimalType,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 0,
                  child: Text(
                    ' >',
                    style: TextStyle(
                        color: Color.fromARGB(255, 36, 86, 38),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Text(
                    'Animal Species',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Text(
                    widget.selectedAnimalSpecies,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 0,
                  child: Text(
                    ' >',
                    style: TextStyle(
                        color: Color.fromARGB(255, 36, 86, 38),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
            Row(
              children: [
                const Expanded(
                  flex: 4,
                  child: Text(
                    'Animal Breed',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Text(
                    widget.selectedAnimalBreed,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 0,
                  child: Text(
                    ' >',
                    style: TextStyle(
                        color: Color.fromARGB(255, 36, 86, 38),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CompleteInfo(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 36, 86, 38),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Text(
            'Create Animal',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
