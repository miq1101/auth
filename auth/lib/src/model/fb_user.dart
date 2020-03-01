class FBUser {
  String firstName;
  String lastName;
  String gender;
  String birthDay;
  String email;
  String photoUrl;
  String location;
  String homeTown;
  String friendsCount;

  FBUser(
      {this.firstName,
      this.lastName,
      this.gender,
      this.birthDay,
      this.email,
      this.photoUrl,
      this.location,
      this.homeTown,
      this.friendsCount});

  factory FBUser.fromJson(Map json) => FBUser(
        firstName: json["first_name"] as String,
        lastName: json["last_name"] as String,
        gender: json["gender"] as String,
        birthDay: json["birthday"] as String,
        email: json["email"] as String,
        photoUrl: json["picture"]["data"]["url"] as String,
        location: json["location"]["name"] as String,
        homeTown: json["hometown"]["name"] as String,
        friendsCount: (json["friends"]["summary"]["total_count"]).toString(),
      );
}
