class Registers {
  final List<Register>? registers;

  Registers({
    this.registers,
  });

  factory Registers.fromJson(List<dynamic> json) => Registers(
        registers: json.map((e) => Register.fromJson(e)).toList(),
      );
}

class Register {
  final Car? car;
  final Service? service;
  final String? name;
  final String? lastName;
  final String? license;
  final int? phone;
  final String? image;
  final int? id;

  Register(
      {this.car,
      this.service,
      this.name,
      this.lastName,
      this.license,
      this.phone,
      this.image,
      this.id});

  factory Register.fromJson(Map<dynamic, dynamic>? json) {
    return Register(
      car: json != null && json.isNotEmpty ? Car.fromJson(json['Carro']) : null,
      service: json != null && json.isNotEmpty
          ? Service.fromJson(json['Servicio'])
          : null,
      name: json != null && json.isNotEmpty ? json['nombre'] : null,
      lastName: json != null && json.isNotEmpty ? json['apellido'] : null,
      license: json != null && json.isNotEmpty ? json['licencia'] : null,
      image: json != null && json.isNotEmpty ? json['imagen'] : null,
      phone: json != null && json.isNotEmpty ? json['cel'] : null,
      id: json != null && json.isNotEmpty ? json['id'] : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "Carro": car?.toJson(),
        "Servicio": service?.toJson(),
        "apellido": lastName,
        "cel": phone,
        "licencia": license,
        "nombre": name,
        "id": id,
      };
}

class Car {
  final String? color;
  final String? brand;
  final int? model;
  final String? plate;
  Car({this.color, this.brand, this.model, this.plate});

  factory Car.fromJson(Map<dynamic, dynamic>? json) {
    return Car(
      color: json != null && json.isNotEmpty ? json['Color'] : null,
      brand: json != null && json.isNotEmpty ? json['marca'] : null,
      model: json != null && json.isNotEmpty ? json['modelo'] : null,
      plate: json != null && json.isNotEmpty ? json['placa'] : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "Color": color,
        "marca": brand,
        "modelo": model,
        "placa": plate,
      };
}

class Service {
  final String? wash;
  final String? polish;
  final String? upholstery;

  Service({this.wash, this.polish, this.upholstery});

  factory Service.fromJson(Map<dynamic, dynamic> json) {
    return Service(
      wash: json['lavado'],
      polish: json['polish'],
      upholstery: json['tapiceria'],
    );
  }

  Map<String, dynamic> toJson() => {
        "lavado": wash,
        "polish": polish,
        "tapiceria": upholstery,
      };
}
