class Devices {
  int device_id;
  String type;
  String imgUrl;

  Devices(this.device_id,this.type, this.imgUrl);
}

List<Devices> devices = [
  Devices(0,'Smartphone', 'assets/images/smartphone.webp'),
  Devices(1,'Tablet', 'assets/images/tablet.png'),
  Devices(2,'Laptop', 'assets/images/laptop.png'),
  Devices(3,'Desktop', 'assets/images/desktop.png'),
  Devices(4,'Air Conditoner', 'assets/images/ac.png'),
  Devices(5,'Refridgerator', 'assets/images/fridge.png'),
  Devices(6,'Toaster', 'assets/images/toaster.png'),
  Devices(7,'Electric Cooker', 'assets/images/cooker.png'),
];