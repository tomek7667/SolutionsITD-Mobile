import 'dart:convert';

import 'package:auth0_flutter/auth0_flutter.dart';

class User {
  UserProfile? oAuthUserProfile;
  String? userProfileSub;

  String? name;
  String? nickname;
  String? email;
  String? phoneNumber;
  Uri? profileUrl;
  bool? isEmailVerified;
  bool? isPhoneNumberVerified;

  User({this.oAuthUserProfile}) {
    userProfileSub = oAuthUserProfile?.sub;
    name = oAuthUserProfile?.name;
    nickname = oAuthUserProfile?.nickname;
    email = oAuthUserProfile?.email;
    phoneNumber = oAuthUserProfile?.phoneNumber;
    profileUrl = oAuthUserProfile?.profileUrl;
    isEmailVerified = oAuthUserProfile?.isEmailVerified;
    isPhoneNumberVerified = oAuthUserProfile?.isPhoneNumberVerified;
  }

  String toJson() {
    return jsonEncode({
      'userProfileSub': userProfileSub,
      'name': name,
      'nickname': nickname,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileUrl': profileUrl?.toString(),
      'isEmailVerified': isEmailVerified,
      'isPhoneNumberVerified': isPhoneNumberVerified,
    });
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      oAuthUserProfile: UserProfile(
        sub: json['userProfileSub'],
        name: json['name'],
        nickname: json['nickname'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        profileUrl:
            json['profileUrl'] != null ? Uri.parse(json['profileUrl']) : null,
        isEmailVerified: json['isEmailVerified'],
        isPhoneNumberVerified: json['isPhoneNumberVerified'],
      ),
    );
  }
}
