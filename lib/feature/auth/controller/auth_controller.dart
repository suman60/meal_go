import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:meal_go/config/routes/app_routes.dart';
import '../model/user_model.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final isLoading = false.obs;
  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }
    try {
      isLoading.value = true;
      // 🔹 Firebase Auth
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // 🔹 Optional: Reload user to ensure Firestore sees auth
      await credential.user!.reload();
      User? user = _auth.currentUser;
      // 🔹 Update Auth profile
      await user!.updateDisplayName(fullName);
      // 🔹 Firestore User Data
      UserModel userModel = UserModel(
        uid: user.uid,
        fullName: fullName,
        email: email,
      );
      // 🔹 Firestore write
      try {
        await _db.collection('users').doc(user.uid).set(userModel.toMap());
        print("User saved to Firestore successfully!");
      } catch (e) {
        print("Firestore write failed: $e");
        Get.snackbar("Error", "Failed to save user data");
        return;
      }
      // 🔹 Navigate to congrats screen
      Get.offAllNamed(AppRoutes.congrats);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "Auth failed");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password are required");
      return;
    }

    try {
      isLoading.value = true;

      // 🔹 Firebase Auth Sign In
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;

      if (user == null) {
        Get.snackbar("Error", "User not found");
        return;
      }

      // 🔹 Optional: Check if user exists in Firestore
      DocumentSnapshot doc = await _db.collection('users').doc(user.uid).get();

      if (!doc.exists) {
        Get.snackbar("Error", "User data not found in database");
        return;
      }

      // 🔹 Navigate after successful login
      Get.offAllNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Login Failed", e.message ?? "Invalid email or password");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
