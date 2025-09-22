class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User(this.id, this.name, this.username, this.email);

  // JSON to Object
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        username = json['username'],
        email = json['email'];
  
  // Object to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
    };
  }
}