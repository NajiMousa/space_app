// import 'package:bloc/bloc.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// import '../../controllers/firebase_controllers/fb_storage_controller.dart';
// import '../events/storage_events.dart';
// import '../states/storage_states.dart';
//
// class StorageBloc extends Bloc<StorageEvents, StorageStates> {
//   List<Reference> _list = <Reference>[];
//   final FbStorageController _fbStorageController = FbStorageController();
//
//   StorageBloc(StorageStates initialState) : super(initialState) {
//     on<CreateEvent>(_onCreateEvent);          // شو نوع الا1يفينت اللي استقبلناه
//     on<ReadEvent>(_onReadEvent);
//     on<DeleteEvent>(_onDeleteEvent);
//   }
//
//   // void _onCreateEvent(CreateEvent event, Emitter emit) {
//   //   _fbStorageController.uploadImage(
//   //     path: event.filePath,
//   //     fbUploadListener: (
//   //         {String? message,
//   //         Reference? reference,
//   //         required bool status,
//   //         required TaskState taskState}) {
//   //
//   //       if (taskState == TaskState.error) {
//   //         emit(ProcessState(false, message!, Process.create));
//   //       }
//   //
//   //       else if (taskState == TaskState.success) {
//   //         emit(ProcessState(true, message!, Process.create));
//   //         if(reference != null){
//   //           _list.add(reference);
//   //           emit(ReadState(_list));
//   //         }
//   //       }
//   //     },
//   //   );
//   // }
//
//   void _onCreateEvent(CreateEvent event, Emitter emit) async{
//     await _fbStorageController.uploadImage(path: event.filePath).listen((event) {
//       if (event.state == TaskState.error) {
//         emit(ProcessState(false, 'image upload failud'!, Process.create));
//       }
//
//       else if (event.state == TaskState.success) {
//         emit(ProcessState(true, 'image upload Successfly'!, Process.create));
//         _list.add(event.ref);
//         emit(ReadState(_list));
//       }
//     }).asFuture();
//   }
//
//   void _onReadEvent(ReadEvent event, Emitter emit) async{
//     print('0202020202022020202020202020202020202020202020');
//     List<Reference> reference = await  _fbStorageController.read();
//     _list = reference ;
//     print('Read Here ${_list.length}');
//     emit(ReadState(_list));
//   }
//
//   void _onDeleteEvent(DeleteEvent event, Emitter emit) async{
//     bool deleted = await _fbStorageController.delete(path: event.filePath);
//     if(deleted){
//       int index = _list.indexWhere((element) => element.fullPath == event.filePath);
//       if(index == -1) {
//         _list.removeAt(index);
//         emit(ReadState(_list));
//       }
//     }
//     emit(ProcessState(deleted, deleted? 'Deleted Success': ' Deleted Failed', Process.delete));
//   }
// }
