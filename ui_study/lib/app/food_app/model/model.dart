class FoodModel {
  String img; // 主图
  String title; // title
  String time; // 制作时间
  num star; // 星级
  num kcal; // 卡路里
  num price; // 价格
  String about; // 关于
  List<Ingredients> ingredients; // 原料

  FoodModel(this.img, this.title, this.time, this.star, this.kcal, this.price,
      this.about, this.ingredients);

  static List<String> generateTags() {
    return [
      "Recommend",
      "Popular",
      "Noodles",
      "Pizza",
      "Soup",
      "Salad",
      "Stew",
    ];
  }

  static List<FoodModel> generateFoods() {
    return [
      FoodModel(
          "assets/images/dish1.png",
          "Soba Soup With\nShrimp and Greens",
          "20 min",
          4.8,
          325,
          12,
          "Soba Soup is a traditional Japanese soup made with buckwheat noodles and a variety of flavorful ingredients."
              " The broth is usually made with a combination of dashi, soy sauce, and mirin, and can be served hot or cold. It is often"
              " garnished with scallions, nori, and other toppings such as tempura. Soba Soup is a light and refreshing meal that can be enjoyed as a starter or main course.",
          [
            Ingredients("assets/images/ingre1.png", "Noodle"),
            Ingredients("assets/images/ingre2.png", "Shrimp"),
            Ingredients("assets/images/ingre3.png", "Egg"),
            Ingredients("assets/images/ingre4.png", "Scallion"),
          ]),
      FoodModel(
          "assets/images/dish2.png",
          "Orange Sandwiches",
          "25 min",
          4.8,
          325,
          12,
          "Soba Soup is a traditional Japanese soup made with buckwheat noodles and a variety of flavorful ingredients."
              " The broth is usually made with a combination of dashi, soy sauce, and mirin, and can be served hot or cold. It is often"
              " garnished with scallions, nori, and other toppings such as tempura. Soba Soup is a light and refreshing meal that can be enjoyed as a starter or main course.",
          [
            Ingredients("assets/images/ingre1.png", "Noodle"),
            Ingredients("assets/images/ingre2.png", "Shrimp"),
            Ingredients("assets/images/ingre3.png", "Egg"),
            Ingredients("assets/images/ingre4.png", "Scallion"),
          ]),
      FoodModel(
          "assets/images/dish3.png",
          "Sai Ua Samun Phrai",
          "25 min",
          4.8,
          325,
          12,
          "Soba Soup is a traditional Japanese soup made with buckwheat noodles and a variety of flavorful ingredients."
              " The broth is usually made with a combination of dashi, soy sauce, and mirin, and can be served hot or cold. It is often"
              " garnished with scallions, nori, and other toppings such as tempura. Soba Soup is a light and refreshing meal that can be enjoyed as a starter or main course.",
          [
            Ingredients("assets/images/ingre1.png", "Noodle"),
            Ingredients("assets/images/ingre2.png", "Shrimp"),
            Ingredients("assets/images/ingre3.png", "Egg"),
            Ingredients("assets/images/ingre4.png", "Scallion"),
          ]),
      FoodModel(
          "assets/images/dish4.png",
          "Ratatouille Pasta",
          "30 min",
          4.8,
          325,
          12,
          "Soba Soup is a traditional Japanese soup made with buckwheat noodles and a variety of flavorful ingredients."
              " The broth is usually made with a combination of dashi, soy sauce, and mirin, and can be served hot or cold. It is often"
              " garnished with scallions, nori, and other toppings such as tempura. Soba Soup is a light and refreshing meal that can be enjoyed as a starter or main course.",
          [
            Ingredients("assets/images/ingre1.png", "Noodle"),
            Ingredients("assets/images/ingre2.png", "Shrimp"),
            Ingredients("assets/images/ingre3.png", "Egg"),
            Ingredients("assets/images/ingre4.png", "Scallion"),
          ]),
      FoodModel(
          "assets/images/dish1.png",
          "Soba Soup With\nShrimp and Greens",
          "20 min",
          4.8,
          325,
          12,
          "Soba Soup is a traditional Japanese soup made with buckwheat noodles and a variety of flavorful ingredients."
              " The broth is usually made with a combination of dashi, soy sauce, and mirin, and can be served hot or cold. It is often"
              " garnished with scallions, nori, and other toppings such as tempura. Soba Soup is a light and refreshing meal that can be enjoyed as a starter or main course.",
          [
            Ingredients("assets/images/ingre1.png", "Noodle"),
            Ingredients("assets/images/ingre2.png", "Shrimp"),
            Ingredients("assets/images/ingre3.png", "Egg"),
            Ingredients("assets/images/ingre4.png", "Scallion"),
          ]),
      FoodModel(
          "assets/images/dish2.png",
          "Orange Sandwiches",
          "25 min",
          4.8,
          325,
          12,
          "Soba Soup is a traditional Japanese soup made with buckwheat noodles and a variety of flavorful ingredients."
              " The broth is usually made with a combination of dashi, soy sauce, and mirin, and can be served hot or cold. It is often"
              " garnished with scallions, nori, and other toppings such as tempura. Soba Soup is a light and refreshing meal that can be enjoyed as a starter or main course.",
          [
            Ingredients("assets/images/ingre1.png", "Noodle"),
            Ingredients("assets/images/ingre2.png", "Shrimp"),
            Ingredients("assets/images/ingre3.png", "Egg"),
            Ingredients("assets/images/ingre4.png", "Scallion"),
          ]),
    ];
  }
}

class Ingredients {
  String img;
  String text;

  Ingredients(this.img, this.text);
}
