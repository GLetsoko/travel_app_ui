class Activities {
  String imageUrl;
  String name;
  String country;
  String duration;
  String distance;
  String description;
  int price;
  List<String> imageGallery;

  Activities({
    this.imageUrl,
    this.name,
    this.country,
    this.duration,
    this.distance,
    this.description,
    this.price,
    this.imageGallery,
  });
}

List<Activities> activities = [
  Activities(
      imageUrl: 'assets/images/1.jpg',
      name: 'The Golden Circle',
      country: 'Iceland',
      duration: '5-7 days',
      distance: '20 km',
      description:
          'Arctic Adventures offers glicier explorations of various length and difficulty',
      price: 350,
      imageGallery: [
        'assets/images/ice1.jpg',
        'assets/images/ice2.jpg',
        'assets/images/ice3.jpg',
        'assets/images/ice4.jpg'
      ]),
  Activities(
      imageUrl: 'assets/images/2.jpg',
      name: 'Snorkelling',
      country: 'Iceland',
      duration: '11 days',
      distance: '20 km',
      description:
          'Arctic Adventures offers glicier explorations of various length and difficulty',
      price: 470,
      imageGallery: [
        'assets/images/snorketting1.jpg',
        'assets/images/snorketting2.jpg',
        'assets/images/snorketting3.jpg',
        'assets/images/snorketting4.jpg',
      ]),
  Activities(
      imageUrl: 'assets/images/3.jpg',
      name: 'Hiking Mountains',
      country: 'France',
      duration: '4 days',
      distance: '15 km',
      description:
          'Great mountain hiking with explorations of various length and excitment',
      price: 500,
      imageGallery: [
        'assets/images/hiking1.jpg',
        'assets/images/hiking2.jpg',
        'assets/images/hiking3.jpg',
        'assets/images/hiking4.jpg',
      ]),
  Activities(
      imageUrl: 'assets/images/4.jpg',
      name: 'Table Mountain',
      country: 'South Africa',
      duration: '3-7 days',
      distance: '10 km',
      description:
          'Great mountain hiking with explorations of various length and excitment',
      price: 620,
      imageGallery: [
        'assets/images/cpt1.jpg',
        'assets/images/cpt2.jpg',
        'assets/images/cpt3.jpg',
        'assets/images/cpt4.jpg',
        'assets/images/cpt5.jpg',
      ]),
];
