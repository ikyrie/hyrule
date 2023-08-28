enum Categories {
  treasure('treasure', 'TREASURE'),
  monsters('monsters', 'MONSTERS'),
  materials('materials', 'MATERIALS'),
  equipment('equipment', 'EQUIPMENT'),
  creatures('creatures', 'CREATURES');

  final String name;
  final String code;
  const Categories(this.name, this.code);
}
