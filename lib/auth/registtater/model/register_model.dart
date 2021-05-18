class RegisterModel {
  String message;
  UserInfo userInfo;
  bool success;

  RegisterModel({this.message, this.userInfo, this.success});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class UserInfo {
  String userId;
  String name;
  String email;
  String mobile;
  String roleId;
  String profileImage;

  UserInfo(
      {this.userId,
        this.name,
        this.email,
        this.mobile,
        this.roleId,
        this.profileImage});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    roleId = json['roleId'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['roleId'] = this.roleId;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
