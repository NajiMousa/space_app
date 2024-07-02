// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:difaf_al_wafa_app/helpers/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ImagesScreen extends StatefulWidget {
//   const ImagesScreen({Key? key}) : super(key: key);
//
//   @override
//   _ImagesScreenState createState() => _ImagesScreenState();
// }
//
// class _ImagesScreenState extends State<ImagesScreen> with Helper{
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<StorageBloc>(context)
//         .add(ReadEvent()); // لتحويل الحالة من التحميل الى القراءة
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Images'),
//         actions: [
//           IconButton(
//             onPressed: () =>
//                 Navigator.pushNamed(context, '/upload_images_screen'),
//             icon: Icon(
//               Icons.cloud_upload,
//             ),
//           ),
//         ],
//       ),
//       body: BlocConsumer<StorageBloc, StorageStates>(
//         buildWhen: (previous, current) =>
//             current is ReadState || current is LoadingState,
//         // متى يتم الانشاء
//         listenWhen: (previous, current) =>
//             current is ProcessState && current.process == Process.delete,
//         // نستمع لما يكون في حذف
//         listener: (context, state) {
//           state as ProcessState;
//           showSmackBar(context : context , message : state.message  ,error : !state.status,);
//         },
//         builder: (context, state) {
//           if (state is LoadingState) {
//             print('00xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1');
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is ReadState && state.reference.isNotEmpty) {
//             print('00xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx22');
//             return GridView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               itemCount: state.reference.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: FutureBuilder<Object>(
//                       future: state.reference[index].getDownloadURL(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else if (snapshot.hasData) {
//                           return Stack(
//                             children: [
//                               CachedNetworkImage(
//                                 height: double.infinity,
//                                 fit: BoxFit.cover,
//                                 cacheKey: state.reference[index].fullPath,
//                                 // نعمل لها كاش بتسمية نادرة
//                                 imageUrl: snapshot.data.toString(),
//                                 placeholder: (context, url) =>
//                                     CircularProgressIndicator(),
//                                 errorWidget: (context, url, error) =>
//                                     Icon(Icons.error),
//                               ),
//                               Align(
//                                 alignment: AlignmentDirectional.bottomCenter,
//                                 child: Container(
//                                   alignment: AlignmentDirectional.centerEnd,
//                                   child: IconButton(
//                                     onPressed: () => deleteImage(
//                                         filePath:
//                                             state.reference[index].fullPath),
//                                     icon: Icon(Icons.delete),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         } else {
//                           print('We are Here');
//                           return const Center(
//                             child: Icon(
//                               Icons.image,
//                               size: 80,
//                             ),
//                           );
//                         }
//                       }),
//                 );
//               },
//             );
//           } else {
//             print('00xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx3');
//             return const Center(
//               child: Text('No Data'),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<void> deleteImage({required String filePath}) async {
//     BlocProvider.of<StorageBloc>(context).add(DeleteEvent(filePath));
//   }
// }
