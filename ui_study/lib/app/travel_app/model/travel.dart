class Travel {
  String name;
  String location;
  String url;

  Travel(this.name, this.location, this.url);

  static List<Travel> generateTravelBlog() {
    return [
      Travel('Place 1', 'Place1', 'assets/images/top1.jpg'),
      Travel('Place 2', 'Place2', 'assets/images/top2.jpg'),
      Travel('Place 3', 'Place3', 'assets/images/top3.jpg'),
      Travel('Place 4', 'Place4', 'assets/images/top4.jpg'),
      Travel('Place 1', 'Place1', 'assets/images/top1.jpg'),
      Travel('Place 2', 'Place2', 'assets/images/top2.jpg'),
      Travel('Place 3', 'Place3', 'assets/images/top3.jpg'),
      Travel('Place 4', 'Place4', 'assets/images/top4.jpg'),
    ];
  }

  static List<Travel> generateMostBlog() {
    return [
      Travel('Place 5', 'Place5 123456798789789789789', 'assets/images/bottom1.jpg'),
      Travel('Place 6', 'Place6 123456798789789789789', 'assets/images/bottom2.jpg'),
      Travel('Place 7', 'Place7 123456798789789789789', 'assets/images/bottom3.jpg'),
      Travel('Place 8', 'Place8 123456798789789789789', 'assets/images/bottom4.jpg'),
      Travel('Place 5', 'Place5 123456798789789789789', 'assets/images/bottom1.jpg'),
      Travel('Place 6', 'Place6 123456798789789789789', 'assets/images/bottom2.jpg'),
      Travel('Place 7', 'Place7 123456798789789789789', 'assets/images/bottom3.jpg'),
      Travel('Place 8', 'Place8 123456798789789789789', 'assets/images/bottom4.jpg'),
      Travel('Place 5', 'Place5 123456798789789789789', 'assets/images/bottom1.jpg'),
      Travel('Place 6', 'Place6 123456798789789789789', 'assets/images/bottom2.jpg'),
      Travel('Place 7', 'Place7 123456798789789789789', 'assets/images/bottom3.jpg'),
      Travel('Place 8', 'Place8 123456798789789789789', 'assets/images/bottom4.jpg'),
    ];
  }
}
