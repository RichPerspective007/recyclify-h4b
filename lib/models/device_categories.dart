class Devices {
  String type;
  String imgUrl;

  Devices(this.type, this.imgUrl);
}

List<Devices> devices = [
  Devices('Smartphone', 'assets/images/smartphone.webp'),
  Devices('Tablet', 'assets/images/tablet.png'),
  Devices('Laptop', 'assets/images/laptop.png'),
  Devices('Desktop', 'assets/images/desktop.png'),
  Devices('Air Conditoner', 'assets/images/ac.png'),
  Devices('Refridgerator', 'assets/images/fridge.png'),
  Devices('Toaster', 'assets/images/toaster.png'),
  Devices('Electric Cooker', 'assets/images/cooker.png'),
];