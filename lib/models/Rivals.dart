
class Rival {
  int id;
  String imageUrl;
  String city;
  String name;
  String description;
  int rivals;
  double rating;

  Rival({
    required this.id,
    required this.imageUrl,
    required this.city,
    required this.name,
    required this.description,
    required this.rivals,
    required this.rating,
  });
}

List<Rival> rival = [
  Rival(
    id: 0,
    imageUrl: 'assets/images/venice.jpg',
    city: 'الرياض',
    name: 'العاصمة',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    rivals: 45,
    rating: 4.5,
  ),
  Rival(
    id: 1,
    imageUrl: 'assets/images/paris.jpg',
    city: 'جدة',
    name: 'خمسة نجوم',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    rivals: 30,
    rating: 3.0,
  ),
  Rival(
    id: 2,
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'المدينة',
    name: 'الرفاهيه',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    rivals: 20,
    rating: 2.0,
  ),
  Rival(
    id: 3,
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'الطائف',
    name: 'الفخامة',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    rivals: 15,
    rating: 1.5,
  ),
  Rival(
    id: 4,
    imageUrl: 'assets/images/newyork.jpg',
    city: 'جازان',
    name: 'الراحة',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    rivals: 10,
    rating: 1.0,
  ),
  Rival(
    id: 5,
    imageUrl: 'assets/images/venice.jpg',
    city: 'عسير',
    name: 'الواحة',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    rivals: 45,
    rating: 4.5,
  ),
  Rival(
    id: 6,
    imageUrl: 'assets/images/paris.jpg',
    city: 'مكة',
    name: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    rivals: 30,
    rating: 3.0,
  ),
];
