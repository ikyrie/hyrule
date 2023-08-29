enum Categories {
  treasure('Treasure', 'TREASURE'),
  monsters('Monsters', 'MONSTERS'),
  materials('Materials', 'MATERIALS'),
  equipment('Equipment', 'EQUIPMENT'),
  creatures('Creatures', 'CREATURES');

  final String name;
  final String code;
  const Categories(this.name, this.code);
}
