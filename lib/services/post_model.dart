class Post {
  final String id;
  final double price;
  final int amount;
  final double total;
  final double day_change;

  Post(
      {required this.id,
      required this.price,
      required this.amount,
      required this.total,
      required this.day_change});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['bitcoin'] as String,
        price: json['price'] as double,
        amount: json['amount'] as int,
        total: json['total'] as double,
        day_change: json['day_change'] as double);
  }
}
