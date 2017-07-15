# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
race_list = [
  'Chilaquil',
  'Golden Retriever',
  'Dalmata',
  'Dobberman'
]

race_list.each do |name|
  Race.create(name: name)
end 

tag_list = [
  'Busco a mi dueño',
  'Busco a mi perro'
]

tag_list.each do |name|
  Tag.create(name:name)
end