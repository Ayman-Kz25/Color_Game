void main() {
  var tesla = ElectricCar("EV-101", "Tesla", 120, 80, 90);
  var truck = DeliveryTruck("TR-550", "Volvo", 90, 60, 500);

  tesla.startEngine();
  tesla.navigate("City Center");
  tesla.enableAutoPilot();
  tesla.charge();
  tesla.stopEngine();

  print("\n-------------------\n");

  truck.startEngine();
  truck.loadCargo(200);
  truck.navigate("Warehouse");
  truck.scheduleService();
  truck.stopEngine();
}

// ================= PARENT CLASS =================

class Vehicle {
  String vehicleNumber;
  String brand;
  int speed;
  int fuelLevel;

  Vehicle(this.vehicleNumber, this.brand, this.speed, this.fuelLevel);

  void startEngine() {
    print("$brand vehicle ($vehicleNumber) engine started.");
  }

  void stopEngine() {
    print("$brand vehicle ($vehicleNumber) engine stopped.");
  }
}

// ================= CHILD CLASS 1 =================

class ElectricCar extends Vehicle with GPS, Maintenance {
  int batteryLevel;

  ElectricCar(String number, String brand, int speed, int fuel, this.batteryLevel)
      : super(number, brand, speed, fuel);

  void charge() {
    batteryLevel = 100;
    print("Battery fully charged.");
  }

  void enableAutoPilot() {
    print("Autopilot mode enabled.");
  }
}

// ================= CHILD CLASS 2 =================

class DeliveryTruck extends Vehicle with GPS, Maintenance {
  int cargoWeight;

  DeliveryTruck(String number, String brand, int speed, int fuel, this.cargoWeight)
      : super(number, brand, speed, fuel);

  void loadCargo(int weight) {
    cargoWeight += weight;
    print("Loaded $weight kg cargo. Total cargo: $cargoWeight kg");
  }

  void unloadCargo() {
    cargoWeight = 0;
    print("Cargo unloaded.");
  }
}

// ================= MIXIN 1 =================

mixin GPS {
  void navigate(String destination) {
    print("Navigating to $destination using GPS.");
  }
}

// ================= MIXIN 2 =================

mixin Maintenance {
  void scheduleService() {
    print("Service scheduled successfully.");
  }

  void checkStatus() {
    print("Vehicle status checked.");
  }
}