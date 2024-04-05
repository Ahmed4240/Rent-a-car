import 'package:rent_a_car/core/error/exceptions.dart';
import 'package:rent_a_car/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;
  Future<UserModel> signUpWithEmailPassword(
      {required String name, required String email, required String password});

  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password});

  Future<UserModel?> getCurrentUseData();
  Future<bool> userLogout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(password: password, email: email);

      return UserModel.fromJson(response.user!.toJson())
          .copyWith(email: response.user!.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});


      return UserModel.fromJson(response.user!.toJson())
          .copyWith(email: response.user!.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }


  @override
  Future<bool> userLogout() async {
    try {
      await supabaseClient.auth.signOut();
      if(currentUserSession?.user != null){
        return false;
      }else{
        return true;
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUseData() async {
    try{
      if(currentUserSession != null){
        final user = await supabaseClient.from("profiles").select().eq('id', currentUserSession!.user.id);
        return UserModel.fromJson(user.first).copyWith(
          email: currentUserSession!.user.email,);
      }else{
        return null;
      }
    }catch (e){
      throw ServerException(e.toString());
    }
  }
}
