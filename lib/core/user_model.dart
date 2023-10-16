class UserData {
  int? id = 0;
  String? token = "";
  String? name = "";
  String? email = "";
  String? profile_pic = "";
  String? rider_level = "";
  String? phone = "";
  String? address_line = "";
  String? city = "";
  String? state = "";
  String? zip = "";
  String? country = "";
  int? is_blocked = 0;

  String? created_at = "";
  String? updated_at = "";

  UserData(
      {this.id,
        this.name,
        this.email,
        this.token,
        this.profile_pic,
        this.rider_level,
        this.phone,
        this.address_line,
        this.city,
        this.state,
        this.zip,
        this.country,
        this.is_blocked,

        this.created_at,
        this.updated_at});

  UserData.fromJson({required Map<String, dynamic>user}) {
    id = user['id'];
    token = user['token'];
    name = user['name'];
    email = user['email'];

    profile_pic = user['profile_pic'];
    rider_level = user['rider_level'];
    phone = user['phone'];
    address_line = user['address_line'];
    city = user['city'];
    state = user['state'];
    zip = user['zip'];
    country = user['country'];
    is_blocked = user['is_blocked'];
    created_at = user['created_at'];
    updated_at = user['updated_at'];
  }


  Map<String, dynamic> toMap() {
    return{
      'id' : id,
      'token': token,
      'name' : name,
      'email' : email,
      'profile_pic' : profile_pic,
      'rider_level' : rider_level,
      'phone' : phone,
      'address_line' : address_line,
      'city' : city,
      'state' : state,
      'zip' : zip,
      'country' : country,
      'is_blocked' : is_blocked,
      'created_at' : created_at,
      'update_at' : updated_at,



    };

  }
}