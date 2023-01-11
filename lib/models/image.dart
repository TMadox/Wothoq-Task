class Image {
    Image({
        required this.id,
        required this.img,
    });

    final int id;
    final String img;

    Image copyWith({
        int? id,
        String? img,
    }) => 
        Image(
            id: id ?? this.id,
            img: img ?? this.img,
        );

    factory Image.fromMap(Map<String, dynamic> json) => Image(
        id: json["id"],
        img: json["img"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "img": img,
    };
}