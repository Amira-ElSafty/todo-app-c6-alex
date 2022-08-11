import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_todo_c6_alex/model/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
      fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
      toFirestore: (task, options) => task.toJson());
}

Future<void> addTaskToFirebase(Task task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id; // auto generated
  return docRef.set(task);
}
Future<void> deleteTaskFromFireStore(Task task){
  return getTaskCollection().doc(task.id).delete();
}


