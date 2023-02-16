class House {
  String name;
  String address;
  String imageUrl;

  House(this.name, this.address, this.imageUrl);

  static List<House> generateRecommended() {
    return [
      House('The Moon House1', '1P455, Chhatak, Sylhet',
          'assets/images/house01.jpeg'),
      House('The Moon House2', '2P455, Chhatak, Sylhet',
          'assets/images/house02.jpeg'),
      House('The Moon House3', '3P455, Chhatak, Sylhet',
          'assets/images/house01.jpeg'),
      House('The Moon House4', '4P455, Chhatak, Sylhet',
          'assets/images/house02.jpeg'),
    ];
  }

  static List<House> generateBestOffer() {
    return [
      House('The Moon House5', '1P455, Chhatak, Sylhet',
          'assets/images/offer01.jpeg'),
      House('The Moon House6', '2P455, Chhatak, Sylhet',
          'assets/images/offer02.jpeg'),
      House('The Moon House7', '3P455, Chhatak, Sylhet',
          'assets/images/offer01.jpeg'),
      House('The Moon House8', '4P455, Chhatak, Sylhet',
          'assets/images/offer02.jpeg'),
    ];
  }
}
