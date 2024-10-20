enum Skill { dart, flutter, other }

class Address {
  String? _street;
  String? _city;
  String? _zipCode;

  Address({String? street, String? city, String? zipCode}){
    _street = street;
    _city = city;
    _zipCode = zipCode;
  }

  @override
  String toString(){
    return """
    Address:
      Street: $_street
      City: $_city
      ZipCode: $_zipCode
    """;
  }
}

  //Class Employee
  class Employee{
    final String _name;
    final int _age;
    final Address? _address;
    final List<Skill> _skills;
    final int _yearsOfExperience;
  
    static const double _baseSalary = 1000.0;
  
    Employee(this._name, this._age, this._address, this._skills, this._yearsOfExperience);
  
    //Update the constructor
    Employee.MobileDeveloper(String name, int age)
    : _name = name,
      _age = age,
      _address = null,
      _skills = [Skill.dart, Skill.flutter],
      _yearsOfExperience = 0;
  
    //Getter Method
    String get name => _name;
    int get age => _age;
    Address? get address => _address;
    List<Skill> get skills => _skills;
    int get yearsOfExperience => _yearsOfExperience;
  
    //Method to compute the salary
    double computeSalary(){
      double salary = _baseSalary + (_yearsOfExperience * 100);
      for(var skill in _skills){
        switch(skill){
          case Skill.dart:
            salary += 200;
            break;
          case Skill.flutter:
            salary += 300;
            break;
          default:
          salary += 1000; 
        }
      }
      return salary;
    }

    @override
    String toString(){
      return 'Employee:\n'
      'Name: $_name\n'
      'Age: $_age\n'
      'Address: ${_address??"No address"}\n'
      'Skills: $_skills\n'
      'Years of Experience: $_yearsOfExperience\n'
      'Salary: \$${computeSalary()}';

    }
  }

void main()
{
  Address address1 = Address(street: '168 pp', city: 'Phnom Penh', zipCode: '10001');

  Employee employee1 = Employee('Sithol pen', 20, address1, [Skill.dart, Skill.flutter], 2);
  Employee employee2 = Employee.MobileDeveloper('Elon Mask', 35);  

  print(employee1);
  print(employee2);
}