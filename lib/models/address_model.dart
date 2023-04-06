
class AddressModel{
  int? id;
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postCode;
  String country;
  String email;
  String phone;



  AddressModel({
    this.id,
  required this.firstName,
  required this.lastName,
  required this.company,
  required this.address1,
  required this.address2,
  required this.city,
  required this.state,
    required this.postCode,
    required this.country,
    required this.email,
    required this.phone,
  });


  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'firstName':firstName,
      'lastName':lastName,
      'company':company,
      'address1':address1,
      'address2':address2,
      'city':city,
      'state':state,
      'postCode':postCode,
      'country':country,
      'email':email,
      'phone':phone,
    };
  }

  factory AddressModel.fromMap(Map<String,dynamic> map){

    return AddressModel(
         id: map['id']??"",
        firstName: map['firstName']??"",
        lastName: map['lastName']??"",
        company: map['company']??"",
        address1: map['address1']??"",
        address2: map['address2']??"",
        city: map['city']??"",
        state: map['state']??"",
        postCode: map['postCode']??"",
        country: map['country']??"",
        email: map['email']??"",
        phone: map['phone']??"",
    );
  }



}


