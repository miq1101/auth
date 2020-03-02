class FBUser {
  String firstName;
  String lastName;
  String gender;
  String birthDay;
  String email;
  String location;
  String homeTown;
  String friendsCount;

  FBUser(
      {this.firstName,
      this.lastName,
      this.gender,
      this.birthDay,
      this.email,
      this.location,
      this.homeTown,
      this.friendsCount});

  factory FBUser.fromJson(Map json) => FBUser(
        firstName: json["first_name"] == null ? "" : json["first_name"],
        lastName: json["last_name"] == null ? "" : json["last_name"],
        gender: json["gender"] == null ? "" : json["gender"],
        birthDay: json["birthday"] == null ? "" : json["birthday"],
        email: json["email"] == null ? "" : json["email"],
        location: json["location"] == null ? "" : json["location"]["name"],
        homeTown: json["hometown"] == null ? "" : json["hometown"]["name"],
        friendsCount: json["friends"] == null
            ? ""
            : (json["friends"]["summary"]["total_count"]).toString(),
      );
}
