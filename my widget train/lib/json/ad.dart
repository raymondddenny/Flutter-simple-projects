class UserAd {
  String company;
  String url;
  String text;

  UserAd({this.company, this.url, this.text});

  factory UserAd.fromJson(Map<String, dynamic> object) {
    return UserAd(
        company: object['company'].toString(),
        url: object['url'],
        text: object['text']);
  }
}
