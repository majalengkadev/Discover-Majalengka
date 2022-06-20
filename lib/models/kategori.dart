class Kategori {
  final int id;
  final String name;
  final String slug;
  final String image;

  Kategori({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory Kategori.fromMap(Map<String, dynamic> map) {
    return Kategori(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      image: map['image_url'] ?? '',
    );
  }
}
