class Job {
  String icon;
  String companyName; // company name
  bool collect; // 收藏
  String jobName; // job Name
  String location;
  List<String> requirement;

  Job(this.icon, this.companyName, this.collect, this.jobName, this.location,
      this.requirement);

  static List<String> generateJobTags() {
    return [
      "Devlopment",
      "Business",
      "Data",
      "Design",
      "Golang",
      "Flutter",
      "Rust",
      "Python",
    ];
  }

  static List<Job> generateJobs() {
    return [
      Job("assets/images/airbnb_logo.png", "Airbnb inc,", false,
          "VP Business Intelegence", "50 Herminia Stravenue,\nCananda", [
        "人と人がどんどんつながる、そんな世界を創造しよう",
        "Airbnbコミュニティに最高の体験をお届けできるよう、チーム一丸となって開発に取り組んでいます。",
        "社の内外でインスピレーションと学びの機会を探し求めています。",
        "人生とは忙しく働く中で過ぎるもの。仕事は楽しまなくては始まりません。当社は楽しい企画が盛り沢山。",
        "人生とは忙しく働く中で過ぎるもの。仕事は楽しまなくては始まりません。当社は楽しい企画が盛り沢山。",
        "人生とは忙しく働く中で過ぎるもの。仕事は楽しまなくては始まりません。当社は楽しい企画が盛り沢山。",
        "人生とは忙しく働く中で過ぎるもの。仕事は楽しまなくては始まりません。当社は楽しい企画が盛り沢山。",
        "人生とは忙しく働く中で過ぎるもの。仕事は楽しまなくては始まりません。当社は楽しい企画が盛り沢山。",
        "人生とは忙しく働く中で過ぎるもの。仕事は楽しまなくては始まりません。当社は楽しい企画が盛り沢山。",
      ]),
      Job("assets/images/google_logo.png", "Google inc,", false,
          "Field Sales Representative, Google Cloud", "香港,\nHong Kong", [
        "The Google Cloud Platform team helps customers transform and build what's next for their business",
        "Our products are engineered for security",
        "reliability and scalability, running the full stack from infrastructure to applications to devices and hardware",
      ]),
      Job(
          "assets/images/linkedin_logo.png",
          "Linkedin inc,",
          true,
          "フルリモート可能／システムエンジニア／「Flutter」資産運用サービス開発／経験者のみ／フリーランス",
          "虎ノ門（東京都),\nJapen", [
        "資産運用Webサービスの開発において、　Flutterを用いたモバイルアプリの実装をお任せします。",
        "Flutter開発経験1年以上",
        "自社サービスあり,服装自由,ベンチャー企業,急募,長期案件",
      ]),
      Job("assets/images/airbnb_logo.png", "Airbnb inc,", false,
          "VP Business Intelegence", "50 Herminia Stravenue,\nCananda", [
        "人と人がどんどんつながる、そんな世界を創造しよう",
        "Airbnbコミュニティに最高の体験をお届けできるよう、チーム一丸となって開発に取り組んでいます。",
        "社の内外でインスピレーションと学びの機会を探し求めています。",
        "人生とは忙しく働く中で過ぎるもの。仕事は楽しまなくては始まりません。当社は楽しい企画が盛り沢山。"
      ]),
      Job("assets/images/google_logo.png", "Google inc,", false,
          "Field Sales Representative, Google Cloud", "香港,\nHong Kong", [
        "The Google Cloud Platform team helps customers transform and build what's next for their business",
        "Our products are engineered for security",
        "reliability and scalability, running the full stack from infrastructure to applications to devices and hardware",
      ]),
      Job(
          "assets/images/linkedin_logo.png",
          "Linkedin inc,",
          false,
          "フルリモート可能／システムエンジニア／「Flutter」資産運用サービス開発／経験者のみ／フリーランス",
          "虎ノ門（東京都),\nJapen", [
        "資産運用Webサービスの開発において、　Flutterを用いたモバイルアプリの実装をお任せします。",
        "Flutter開発経験1年以上",
        "自社サービスあり,服装自由,ベンチャー企業,急募,長期案件",
      ]),
      Job("assets/images/airbnb_logo.png", "Airbnb inc,", false,
          "VP Business Intelegence", "50 Herminia Stravenue,\nCananda", [
        "人と人がどんどんつながる、そんな世界を創造しよう",
        "Airbnbコミュニティに最高の体験をお届けできるよう、チーム一丸となって開発に取り組んでいます。",
        "社の内外でインスピレーションと学びの機会を探し求めています。",
        "人生とは忙しく働く中で過ぎるもの。仕事は楽しまなくては始まりません。当社は楽しい企画が盛り沢山。"
      ]),
      Job("assets/images/google_logo.png", "Google inc,", false,
          "Field Sales Representative, Google Cloud", "香港,\nHong Kong", [
        "The Google Cloud Platform team helps customers transform and build what's next for their business",
        "Our products are engineered for security",
        "reliability and scalability, running the full stack from infrastructure to applications to devices and hardware",
      ]),
      Job(
          "assets/images/linkedin_logo.png",
          "Linkedin inc,",
          false,
          "フルリモート可能／システムエンジニア／「Flutter」資産運用サービス開発／経験者のみ／フリーランス",
          "虎ノ門（東京都),\nJapen", [
        "資産運用Webサービスの開発において、　Flutterを用いたモバイルアプリの実装をお任せします。",
        "Flutter開発経験1年以上",
        "自社サービスあり,服装自由,ベンチャー企業,急募,長期案件",
      ]),
    ];
  }
}
