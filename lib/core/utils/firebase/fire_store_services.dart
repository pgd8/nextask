import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nextask/core/data/models/task_model.dart';
import 'package:nextask/core/utils/constants.dart';

class FireStoreServices {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final collection = firestore.collection(Constants.tasksCollection);

  //CRUD => C - create  , R - read , U - update , D - delete

  //create
  void createTask({required TaskModel task}) {
    var docRef = collection.doc();
    task.id = docRef.id;
    docRef.set(task.toFireStore());
  }

  //read
  Stream<List<TaskModel>> readTasks() {
    return collection.snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => TaskModel.fromFireStore(doc.data()))
          .toList(),
    );
  }
}
