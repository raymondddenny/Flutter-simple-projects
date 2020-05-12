class UserData {
  String id;
  String name;
  String email;

  UserData({this.id, this.name, this.email});

  factory UserData.fromJson(Map<String, dynamic> object) {
    return UserData(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name'],
        email: object['email']);
  }
}
