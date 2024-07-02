import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStoryScreen extends StatefulWidget {
  @override
  _AddStoryScreenState createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  final TextEditingController _contentController = TextEditingController();
  // final List<File> _imageFiles = [];
  // final List<File> _videoFiles = [];
  final List<String> _selectedMartyrIds = [];

  // final ImagePicker _picker = ImagePicker();
  //
  // Future<void> _pickImages() async {
  //   final List<XFile>? pickedFiles = await _picker.pickMultiImage();
  //   if (pickedFiles != null) {
  //     setState(() {
  //       _imageFiles.addAll(pickedFiles.map((file) => File(file.path)));
  //     });
  //   }
  // }
  //
  // Future<void> _pickVideos() async {
  //   final XFile? pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _videoFiles.add(File(pickedFile.path));
  //     });
  //   }
  // }

  Future<void> _submitStory() async {
    final content = _contentController.text;

    // final List<String> imageUrls = await _uploadFiles(_imageFiles, 'images');
    // final List<String> videoUrls = await _uploadFiles(_videoFiles, 'videos');

    // await FirebaseFirestore.instance.collection('stories').add({
    //   'content': content,
    //   'martyrIds': _selectedMartyrIds,
    //   'imageUrls': imageUrls,
    //   'videoUrls': videoUrls,
    //   'createdAt': FieldValue.serverTimestamp(),
    // });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Story submitted successfully!')));
    _resetForm();
  }

  // Future<List<String>> _uploadFiles(List<File> files, String folder) async {
  //   final List<String> urls = [];
  //   for (final file in files) {
  //     final ref = FirebaseStorage.instance.ref().child('$folder/${file.uri.pathSegments.last}');
  //     await ref.putFile(file);
  //     final url = await ref.getDownloadURL();
  //     urls.add(url);
  //   }
  //   return urls;
  // }

  void _resetForm() {
    _contentController.clear();
    setState(() {
      // _imageFiles.clear();
      // _videoFiles.clear();
      _selectedMartyrIds.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Story'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _contentController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Text Content',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed:(){},
              // _pickImages,
              child: Text('Pick Images'),
            ),
            Wrap(
              // children: _imageFiles.map((file) => Image.file(file, width: 100, height: 100)).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){},
              // _pickVideos,
              child: Text('Pick Videos'),
            ),
            Wrap(
              // children: _videoFiles.map((file) => Icon(Icons.videocam, size: 100)).toList(),
            ),
            SizedBox(height: 16),
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('martyrs').get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                final martyrs = snapshot.data!.docs;
                return DropdownButtonFormField<String>(
                  items: martyrs.map((doc) {
                    return DropdownMenuItem(
                      value: doc.id,
                      child: Text(doc['name']),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null && !_selectedMartyrIds.contains(value)) {
                      setState(() {
                        _selectedMartyrIds.add(value);
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Mention Martyrs',
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            Wrap(
              children: _selectedMartyrIds.map((id) => Chip(
                label: Text(id),
                onDeleted: () {
                  setState(() {
                    _selectedMartyrIds.remove(id);
                  });
                },
              )).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitStory,
              child: Text('Submit Story'),
            ),
          ],
        ),
      ),
    );
  }
}