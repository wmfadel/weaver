import 'package:authentication/authentication.dart';
import 'package:authentication/src/firebase_auth_wrapper.dart';
import 'package:authentication/src/firebase_user_store.dart';
import 'package:authentication/src/models/app_user.dart';
import 'package:authentication/src/user_secure_storage.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_test.mocks.dart';

@GenerateMocks([
  UserSecureStorage,
  FirebaseUserStore,
  FirebaseAuthWrapper,
])
void main() {
  group('Testing Authentication', () {
    final mockUserSecureStorage = MockUserSecureStorage();
    final mockFirebaseUserStore = MockFirebaseUserStore();
    final mockFirebaseAuthWrapper = MockFirebaseAuthWrapper();
    final Authentication authentication = Authentication(
      secureStorage: mockUserSecureStorage,
      firebaseAuthWrapper: mockFirebaseAuthWrapper,
      firebaseUserStore: mockFirebaseUserStore,
    );

    when(mockUserSecureStorage.getUserInfo()).thenAnswer((_) async => null);
    test('When calling getUser, return null if no user logged in', () async {
      expect(authentication.getUser(), emits(null));
    });

    final user = MockUser(
        isAnonymous: false, uid: 'uid', email: 'email', displayName: 'name');
    final appUser = AppUser(id: 'id', name: 'name', email: 'email');
    when(mockFirebaseAuthWrapper.loginWithEmailAndPassword(
            email: 'email', password: 'password'))
        .thenAnswer((_) async => user);
    when(mockFirebaseUserStore.fetchRemoteUser(authUser: user))
        .thenAnswer((_) async => appUser);
    when(mockUserSecureStorage.upsertUserInfo(user: appUser))
        .thenAnswer((_) async {});
    test('when logged in user stream should have value', () {
      authentication.loginWithEmailAndPassword(
          email: 'email', password: 'password');
      expect(authentication.getUser(), emits(isA<AppUser?>()));
    });
  });
}
