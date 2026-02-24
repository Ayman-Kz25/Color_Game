void main() {
  var mage1 = Mage(100, 100, "Gandalf", 500);
  var mage2 = Mage(100, 100, "Dumbledore", 1000);

  // mage1.attack();
  // mage1.castSpell();

  // mage2.fly();
  // mage2.eat();
  // mage2.sleep();

  var w1 = Warrior(100, 100, "Verneck", 500);
  w1.performSwing("slash");
}

//Parent Class
class Fighter {
  int health;
  int power;
  String name;

  Fighter(this.health, this.power, this.name);

  void attack() {
    print("$name performs a basic attack!");
    power -= 10;
    print("Remaining Power is $power");
  }
}

//Child Class
class Mage extends Fighter with RegularAbilities, SpecialAbilities {
  int mana;

  Mage(int health, int power, String name, this.mana)
    : super(health, power, name);

  void castSpell() {
    print("$name Casts a Magic Spell!");
    mana -= 10;
    print("Remaining Mana is $mana");
  }
}

class Warrior extends Fighter with RegularAbilities {
  int attackPower;

  Warrior(int health, int power, String name, this.attackPower)
    : super(health, power, name);

  void performSwing(String attackType){
    print("$name attack the enemy with $attackType");
    attackPower += 10;
    print("Remaining Attack Power is: $attackPower");
  }
}

//Extra Classes for Inheritance using Mixin
mixin RegularAbilities {
  void sleep() => print("ZzzZzzZzz...");
  void eat() => print("Energy Restored. Yeah!");
}

mixin SpecialAbilities {
  void fly() => print("Flying up in the sky!");
}
