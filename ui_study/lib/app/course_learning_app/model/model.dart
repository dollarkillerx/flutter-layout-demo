class Course {
  String img;
  String auth;
  String description;

  Course(this.img, this.auth, this.description);

  static List<Course> generateCourse() {
    return [
      Course("assets/images/landscape-gc7b2c3766_1920.jpg", "Luma Lanori",
          "Paint techniques"),
      Course("assets/images/pexels-ranger-zang-14110127.jpg", "Daniel didTo",
          "Mushroc"),
      Course("assets/images/4546073.jpg", "Luma Lanori", "Paint techniques"),
      Course(
          "assets/images/HD-wallpaper-hatsune-miku-wreath-dress-forest-anime-blue-eyes-nature-vocaloid-blue-hair-long-hair-twintails-tree-anime-girl-wet-flower.jpg",
          "Luma Lanori",
          "Paint techniques"),
      Course(
        "assets/images/HD-wallpaper-menma-tree-water-girl-anime-white-hair-nature-blue-eyes.jpg",
        "Paint techniques",
        "Paint techniques",
      )
    ];
  }
}
