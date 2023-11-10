class UserModel{
  String id; 
  String name;
  String lastname;
  String email; 

  UserModel({
    this.id = "",
    required this.name,
    required this.lastname,
    required this.email,
  });

  Map<String,dynamic> toJson()=>{
    'id': id,
    'name':name,
    'lastname':lastname,
    'email':email
  };

  static UserModel fromJson(Map<String,dynamic>json) => UserModel(
    id: json["id"],
    name: json["name"], 
    lastname:json ["lastname"],
    email: json["email"]
  );
}