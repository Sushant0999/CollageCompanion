class UserModals {
  String? name;
  int? rollNo;
  String? email;

  UserModals({this.name, this.rollNo, this.email});

  //data from server
  factory UserModals.fromMap(map) {
    return UserModals(
      name: map['name'],
      rollNo: map['rollNo'],
      email: map['email'],
    );
  }

  //sending to server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rollNo': rollNo,
      'email': email,
    };
  }
}
