// import 'package:flutter/material.dart';
//
// class AddUserStoryScreen extends StatefulWidget {
//   const AddUserStoryScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddUserStoryScreen> createState() => _AddUserStoryScreenState();
// }
//
// class _AddUserStoryScreenState extends State<AddUserStoryScreen> {
//   final ImagePicker _picker = ImagePicker();
//   XFile? _mediaFile;
//   VideoPlayerController? _videoController;
//   String _caption = '';
//
//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _mediaFile = pickedFile;
//       _videoController = null; // Reset video controller if picking an image
//     });
//   }
//
//   // Future<void> _pickVideo() async {
//   //   final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
//   //   if (pickedFile != null) {
//   //     _videoController = VideoPlayerController.file(File(pickedFile.path))
//   //       ..initialize().then((_) {
//   //         setState(() {
//   //           _mediaFile = pickedFile;
//   //         });
//   //         _videoController!.play();
//   //       });
//   //   }
//   // }
//
//   void _submitStory() {
//     if (_mediaFile != null) {
//       // Handle story submission
//       print('Caption: $_caption');
//       print('Media Path: ${_mediaFile!.path}');
//       // Reset form
//       setState(() {
//         _mediaFile = null;
//         _caption = '';
//         _videoController?.dispose();
//         _videoController = null;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add New Story'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             if (_mediaFile != null)
//               _videoController != null
//                   ? AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               )
//                   : Image.file(File(_mediaFile!.path)),
//             SizedBox(height: 16.0),
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Caption'),
//               maxLines: 2,
//               onChanged: (value) {
//                 setState(() {
//                   _caption = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: _pickImage,
//                   icon: Icon(Icons.image),
//                   label: Text('Pick Image'),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: _pickVideo,
//                   icon: Icon(Icons.videocam),
//                   label: Text('Pick Video'),
//                 ),
//               ],
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: _submitStory,
//               child: Text('Submit Story'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
