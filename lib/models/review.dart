class Review {
    Review({
        required this.userName,
        required this.review,
        required this.rate,
        required this.createdAt,
    });

    final String userName;
    final String review;
    final int rate;
    final String createdAt;

    Review copyWith({
        String? userName,
        String? review,
        int? rate,
        String? createdAt,
    }) => 
        Review(
            userName: userName ?? this.userName,
            review: review ?? this.review,
            rate: rate ?? this.rate,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Review.fromMap(Map<String, dynamic> json) => Review(
        userName: json["user_name"],
        review: json["review"],
        rate: json["rate"],
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toMap() => {
        "user_name": userName,
        "review": review,
        "rate": rate,
        "created_at": createdAt,
    };
}