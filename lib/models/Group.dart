class Group {
  String title;
  String imageUrl;
  

  Group({
    required this.imageUrl,
    required this.title,
  });
}

List<Group> group = [
  Group(
    imageUrl: 'assets/images/venice.jpg',
    title: 'مطاعم',
  ),
  Group(
    imageUrl: 'assets/images/paris.jpg',
    title: 'فنادق',
  ),
  Group(
    imageUrl: 'assets/images/newdelhi.jpg',
    title: 'متاجر',
  ),
  Group(
    imageUrl: 'assets/images/saopaulo.jpg',
    title: 'هدايا ',
  ),
  Group(
    imageUrl: 'assets/images/newyork.jpg',
    title: 'العاب',
  ),
  Group(
    imageUrl: 'assets/images/venice.jpg',
    title: 'منتجعات',
  ),
  Group(
    imageUrl: 'assets/images/paris.jpg',
    title: 'سفريات',
  ),
];
