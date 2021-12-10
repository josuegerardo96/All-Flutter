class Fruits {
  String? name;
  String? image;

  Fruits(this.name, this.image);

  String? get getName => this.name;
  set setName(String? name) => this.name = name;

  get getImage => this.image;
  set setImage( image) => this.image = image;
}