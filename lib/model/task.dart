class Task{
  String id ;
  String title ;
  String description ;
  int date ;
  bool isChecked ;

  Task({this.id = '' , required this.title , required this.description , required this.date , this.isChecked = false });

  Map<String , dynamic> toJson(){
    return {
      'id' : id ,
      'title' : title ,
      'description' : description ,
      'date' : date
    };
  }
  Task.fromJson(Map<String,dynamic> json):this(
    title: json['title'] as String ,
    description: json['description'] as String ,
    id: json['id'] as String,
    date:  json['date'] as int
  );


}