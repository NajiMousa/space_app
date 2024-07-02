// import 'dart:io';
//
// import 'package:difaf_al_wafa_app/helpers/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../bloc/bloc/storage_bloc.dart';
// import '../../bloc/events/storage_events.dart';
// import '../../bloc/states/storage_states.dart';
//
// class UploadImagesScreen extends StatefulWidget {
//   const UploadImagesScreen({Key? key}) : super(key: key);
//
//   @override
//   _UploadImagesScreenState createState() => _UploadImagesScreenState();
// }
//
// class _UploadImagesScreenState extends State<UploadImagesScreen> with Helper{
//   ImagePicker _imagePicker = ImagePicker();
//   XFile? _pickedFile;
//   double? _linearProgressValue = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload Image'),
//       ),
//       body:
//       // Column(
//       //   children: [
//       //     LinearProgressIndicator(
//       //       minHeight: 10,
//       //       color: Colors.green,
//       //       backgroundColor: Colors.blue.shade200,
//       //       value: _linearProgressValue,
//       //
//       //     ),
//       //
//       //     Expanded(
//       //       child: _pickedFile != null
//       //           ? Image.file(File(_pickedFile!.path))
//       //           : TextButton(
//       //         onPressed: () => _pickImage,
//       //         style: TextButton.styleFrom(
//       //             minimumSize: const Size(double.infinity, 48)),
//       //         child: const Text(
//       //           'Pick Image',
//       //         ),
//       //       ),
//       //     ),
//       //     ElevatedButton.icon(
//       //       onPressed: () => performUpload(),
//       //       style: ElevatedButton.styleFrom(
//       //           minimumSize: const Size(double.infinity, 48)),
//       //       icon: const Icon(Icons.upload),
//       //       label: const Text('Upload'),
//       //     ),
//       //   ],
//       // ),
//       BlocListener<StorageBloc,StorageStates>(
//         listenWhen: (previous, current) => current is ProcessState && current.process == Process.create,
//         listener: (context, state) {
//           state as ProcessState;
//           // showSnackBar(context : context , message : state.message  ,error : !state.status);
//           if(state.status){ _changeProgressValue(value: state.status ? 1 : 0 );}        //تغيير ع قيمة البرروقرس
//         },
//         child: Column(
//           children: [
//             LinearProgressIndicator(
//               minHeight: 10,
//               color: Colors.green,
//               backgroundColor: Colors.blue.shade200,
//               value: _linearProgressValue,
//
//             ),
//
//             Expanded(
//               child: _pickedFile != null
//                   ? Image.file(File(_pickedFile!.path))
//                   : TextButton(
//                 onPressed: () => _pickImage,
//                 style: TextButton.styleFrom(
//                     minimumSize: const Size(double.infinity, 48)),
//                 child: const Text(
//                   'Pick Image',
//                 ),
//               ),
//             ),
//             ElevatedButton.icon(
//               onPressed: () => performUpload(),
//               style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 48)),
//               icon: const Icon(Icons.upload),
//               label: const Text('Upload'),
//             ),
//           ],
//         ),
//       )
//     );
//   }
//   Future<void> _pickImage() async {
//     XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);              //مصدر الصور من الاستديو الجهاز
//     if(imageFile != null){
//       setState(() {
//         _pickedFile = imageFile;                                                               // حتى ياخذ القيمة و يعرضها
//       });
//     }
//   }
//   Future<void> performUpload() async{
//     if(checkData()){
//       await uploadImage();
//     }
//   }
//   bool checkData(){
//     if(_pickedFile != null){
//       return true;
//     }
//     // ShowSnackBar()
//     return false;
//   }
//   Future<void> uploadImage() async{
//     _changeProgressValue(value: null);
//     BlocProvider.of<StorageBloc>(context).add(CreateEvent(_pickedFile!.path));
//   }
//
//   void _changeProgressValue({double? value}){
//     setState(() {
//       _linearProgressValue = value;
//     });
//   }
// }
