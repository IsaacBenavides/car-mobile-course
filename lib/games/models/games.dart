class Games {
  String? image;
  String? name;

  Games({this.image, this.name});
}

class Persona {
  String? nombre;
  String? apellido;
  String? edad;
  String? telefono;

  Persona({this.nombre, this.apellido, this.edad, this.telefono});
}

final maria = Persona(
  nombre: 'Maria',
  apellido: 'Perez',
  edad: '23',
  telefono: '123456789',
);

final carmen = Persona(
  nombre: 'Carmen',
  apellido: 'Perez',
  edad: '23',
  telefono: '123456789',
);

final games = <Games>[
  Games(
      name: "Roblox",
      image:
          "https://www.lavanguardia.com/files/og_thumbnail/uploads/2021/09/02/6130d99519f60.png"),
  Games(
      name: "Silent Hills",
      image:
          "https://i0.wp.com/hipertextual.com/wp-content/uploads/2020/12/silent-hill-1.jpg?fit=1200%2C736&quality=50&strip=all&ssl=1"),
  Games(
      name: "Forza Horizon 5",
      image:
          "https://static.wikia.nocookie.net/doblaje/images/b/be/Forzahorizon5_keyart.jpg/revision/latest?cb=20220225074339&path-prefix=es"),
  Games(
      name: "League of Legends",
      image:
          "https://cloudfront-us-east-1.images.arcpublishing.com/infobae/CNTWUAMXZRF3BPIYPCNPFHOMJQ.jpg"),
  Games(
      name: "Halo Infinity",
      image:
          "https://static.wikia.nocookie.net/halo/images/3/3e/Halo_infinite_vertical.png/revision/latest?cb=20200722153039&path-prefix=es"),
  Games(
      name: "Roblox",
      image:
          "https://www.lavanguardia.com/files/og_thumbnail/uploads/2021/09/02/6130d99519f60.png"),
  Games(
      name: "Silent Hills",
      image:
          "https://i0.wp.com/hipertextual.com/wp-content/uploads/2020/12/silent-hill-1.jpg?fit=1200%2C736&quality=50&strip=all&ssl=1"),
  Games(
      name: "Forza Horizon 5",
      image:
          "https://static.wikia.nocookie.net/doblaje/images/b/be/Forzahorizon5_keyart.jpg/revision/latest?cb=20220225074339&path-prefix=es"),
  Games(
      name: "League of Legends",
      image:
          "https://cloudfront-us-east-1.images.arcpublishing.com/infobae/CNTWUAMXZRF3BPIYPCNPFHOMJQ.jpg"),
  Games(
      name: "Halo Infinity",
      image:
          "https://static.wikia.nocookie.net/halo/images/3/3e/Halo_infinite_vertical.png/revision/latest?cb=20200722153039&path-prefix=es"),
];
