import 'package:firebase_auth/firebase_auth.dart';

import 'app_user.dart';

extension FirebaseUserToAppUser on User {
  AppUser toAppUser() {
    return AppUser(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
      downVote: 0,
      upVote: 0,
      visibility: true,
    );
  }
}