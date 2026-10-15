enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  const Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

class Employee {
  final String _name;
  final int _baseSalary;
  final int _yearsOfExperience;
  final List<Skill> _skills;
  final Address _address;

  const Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  const Employee.mobileDeveloper(
    this._name,
    this._baseSalary,
    this._address,
    this._yearsOfExperience,
  ) : _skills = const [Skill.DART, Skill.FLUTTER];

  String get name => _name;
  int get baseSalary => _baseSalary;
  int get yearsOfExperience => _yearsOfExperience;
  List<Skill> get skills => _skills;
  Address get address => _address;

  static int _experienceBonusPerYear = 2000;
  static int _flutterBonus = 5000;
  static int _dartBonus = 3000;
  static int _otherBonus = 1000;

  int computeSalary() {
    int skillBonus = 0;

    for (final skill in _skills) {
      if (skill == Skill.FLUTTER) {
        skillBonus += _flutterBonus;
      } else if (skill == Skill.DART) {
        skillBonus += _dartBonus;
      } else if (skill == Skill.OTHER) {
        skillBonus += _otherBonus;
      }
    }

    final int experienceBonus = yearsOfExperience * _experienceBonusPerYear;

    return _baseSalary + experienceBonus + skillBonus;
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000, [Skill.OTHER], Address('Street 123', 'Phnom Penh', '12000'), 2);
  emp1.printDetails();
  print('Total Salary: \$${emp1.computeSalary()}');

  var emp2 = Employee.mobileDeveloper('Ronan', 45000, Address('Street 456', 'Phnom Penh', '12001'),
    3,);
  emp2.printDetails();
  print('Total Salary: \$${emp2.computeSalary()}');

}
