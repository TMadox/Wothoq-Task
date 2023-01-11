class Store {
    Store({
        required this.id,
        required this.name,
        required this.logo,
        required this.fullAddress,
    });

    final int id;
    final String name;
    final String logo;
    final String fullAddress;

    Store copyWith({
        int? id,
        String? name,
        String? logo,
        String? fullAddress,
    }) => 
        Store(
            id: id ?? this.id,
            name: name ?? this.name,
            logo: logo ?? this.logo,
            fullAddress: fullAddress ?? this.fullAddress,
        );

    factory Store.fromMap(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        fullAddress: json["full_address"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "logo": logo,
        "full_address": fullAddress,
    };
}