class AppUser {
  final String? id;
  final String? email;
  final String? name;
  final String? photo;
  final String? bio;
  final int? upVote;
  final int? downVote;
  final bool? visibility;

  AppUser({
    this.id,
    this.email,
    this.name,
    this.photo,
    this.bio,
    this.upVote,
    this.downVote,
    this.visibility,
  });

  AppUser.fromJson(Map<String, dynamic> map, {String? id})
      : id = id ?? map['id'],
        email = map['email'],
        name = map['name'],
        photo = map['photo'],
        bio = map['bio'],
        upVote = map['upVote'],
        downVote = map['downVote'],
        visibility = map['visibility'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photo': photo,
      'bio': bio,
      'upVote': upVote,
      'downVote': downVote,
      'visibility': visibility,
    };
  }

  bool get isValidUserModel => id != null && email != null && name != null;
}
