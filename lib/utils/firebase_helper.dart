import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furniture_admin/screens/home/controller/homecontroller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper
{
  static FirebaseHelper firebaseHelper = FirebaseHelper._();
  FirebaseHelper._();

  /// Firebase auth object (Global)
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// signUp method
  Future<String> signUp({required email , required password, required name})
  async {
    return await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      return 'Success';
    },).catchError((e){
      return '$e';
    });
  }

  /// signIn method
  Future<String> signIn({required email, required password})
  async {
    return await firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      return 'Success';
    },).catchError((e){
      return '$e';
    });
  }

  /// check user is login or not
  bool checkUser()
  {
    User? user = firebaseAuth.currentUser;
    return user != null;
  }

  /// google sign in method
  Future<String> googleSignIn()
  async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    // create a new credential
    var credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
    );
    return await firebaseAuth.signInWithCredential(credential).then((value) {
      return 'Success';
    },).catchError((e){
      return '$e';
    });
  }

  /// sign-out / logout method
  Future<void> signOut()
  async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  /// get user detail
  Future<Map> getUserDetail()
  async {
    User? user  = await firebaseAuth.currentUser;
    String? email = user!.email;
    String? img = user.photoURL;
    String? name = user.displayName;
    Map m1 = {'email':email,'img':img,'name':name};
    return m1;
  }

  // TODO Firebase CRUD Operations

  // firebase database clouding and data handling


  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // get user id
  String? id;
  HomeController homeController = Get.put(HomeController());
  void getUserId()
  async {
    User? user  = await firebaseAuth.currentUser;
    id = user!.uid;
    homeController.adminId.value = user.uid;
    print('$id ============');
  }

  // add data without any login id

  void addProductDetail(Map<String, dynamic> m1)
  {
    firebaseFirestore.collection('ProductList').add(m1);
  }

  /// read or get data from server or firestore

  Stream<QuerySnapshot<Map<String, dynamic>>> readProductData()
  {
    return firebaseFirestore.collection('ProductList').snapshots();
  }

  // edit data of firebase

  void editProduct(String docId,Map<String,dynamic> m1)
  {
    firebaseFirestore.collection('Admin').doc(id).collection('ProductList').doc(docId).set(m1);
    print('Product edited');
  }

  // delete data

  void deleteProduct(String docId)
  {
    firebaseFirestore.collection('ProductList').doc(docId).delete();
    print('Product deleted');
  }


}