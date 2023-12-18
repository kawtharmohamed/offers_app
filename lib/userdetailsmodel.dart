class UserDetailsModel {
  final String Name;
  final String Phone;
  final String Authication;
  final String E_mail ;

  UserDetailsModel({required this.Name,required this.Phone, required this.Authication, required this.E_mail});

  Map<String, dynamic> getJson() => {
    'Name': Name,
    'Phone': Phone,
    'Authication' : Authication,
    'E_mail':E_mail
  };

  factory UserDetailsModel.getModelFromJson(Map<String, dynamic> json) {
    return UserDetailsModel(Name: json["Name"],
        Phone: json["Phone"], Authication: json["Authication"] ,E_mail: json["E_mail"]);
  }
}