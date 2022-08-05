class Rating {
  late String userId;
  late dynamic rating;

  Rating(this.userId, this.rating);

  Rating.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    rating = json['rating'];
  }
}
