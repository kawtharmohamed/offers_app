class Cart {
  // final String id;
  final String image;
  final String price;
  final String name;
  final int quntity;

  Cart(
      {
     //   required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.quntity,});

 factory Cart.getModelFromJson(Map<dynamic, dynamic> res) {
   return Cart (
      //id : res['id'],
       image : res["image"],
     quntity : res["quntity"] as int ,
       name : res["name"],
       price : res["price"],);

      }
      Map < String, dynamic> getJson()=> {
       // 'id': id,
        'image': image,
        'name': name,
        'price': price,
        'quntity': quntity,
      };

  Map<String, dynamic > toMap() {
    return {
     // 'id': id,
      'image': image,
      'name': name,
      'price': price,
      'quntity': quntity,
    };
  }
}
