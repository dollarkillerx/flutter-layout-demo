class Place {
  String title;
  String subtitle;
  String imageUrl;
  double height;

  Place(this.title, this.subtitle, this.imageUrl, this.height);

  static List<Place> generatePlace() {
    return [
      Place("Rain Forest", "Costa Rica", "assets/images/bottom1.jpg", 260),
      Place("Lake Louise", "Canada", "assets/images/bottom2.jpg", 300),
      Place("Plitivice Lakes", "Canada", "assets/images/house01.jpeg", 150),
      Place("Plitivice Lakes", "Canada", "assets/images/bottom3.jpg", 300),
      Place("Dubai", "UAE", "assets/images/bottom4.jpg", 250),
      Place("Rain Forest", "Canada", "assets/images/house02.jpeg", 300),
      Place("Rain Forest", "Canada", "assets/images/top1.jpg", 260),
      Place("Plitivice Lakes", "Costa Rica", "assets/images/top2.jpg", 300),
    ];
  }

  static List<Place> generatePlace2() {
    return [
      Place("Lake Louise", "Canada", "assets/images/bottom2.jpg", 300),
      Place("Plitivice Lakes", "Canada", "assets/images/bottom3.jpg", 300),
      Place("Rain Forest", "Costa Rica", "assets/images/bottom1.jpg", 260),
      Place("Dubai", "UAE", "assets/images/bottom4.jpg", 250),
      Place("Rain Forest", "Canada", "assets/images/top1.jpg", 260),
      Place("Plitivice Lakes", "Canada", "assets/images/house01.jpeg", 150),
      Place("Plitivice Lakes", "Costa Rica", "assets/images/top2.jpg", 300),
      Place("Rain Forest", "Canada", "assets/images/house02.jpeg", 300),
    ];
  }
}
