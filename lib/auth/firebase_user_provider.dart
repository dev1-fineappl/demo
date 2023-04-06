import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TestingFA1FirebaseUser {
  TestingFA1FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TestingFA1FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TestingFA1FirebaseUser> testingFA1FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TestingFA1FirebaseUser>(
      (user) {
        currentUser = TestingFA1FirebaseUser(user);
        return currentUser!;
      },
    );
