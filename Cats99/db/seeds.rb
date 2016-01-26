# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: (Date.today - 1000), color: 'Italian Sky Blue', name: 'Breakfast', sex: 'M', description: 'Loves to eat lunch')
Cat.create!(birth_date: (Date.today - 365), color: 'Phthalo Blue', name: 'Bob Ross', sex: 'M', description: 'Loves painting happy trees')
Cat.create!(birth_date: (Date.today - 2000), color: 'Fuzzy Wuzzy', name: 'Twilight Sparkle', sex: 'F', description: 'Aspires to be a unicorn')
Cat.create!(birth_date: (Date.today - 100000), color: 'Dark Gunmetal', name: 'Marnius Calgar', sex: 'M', description: 'FOR THE EMPEROR! BURN THE HERETIC!')
