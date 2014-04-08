# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pet.create(name: 'Sparky', age: 5, pet_type: 'dog', description: 'A fun, loving puppy', image_url: 'sparky.jpg', status: 'Avaliable')
Pet.create(name: 'Iggy', age: 2.5, pet_type: 'iguana', description: 'He\'s green; He\'s scaly; He\'s lovable.', image_url: 'iggy.jpg', status: 'Avaliable')
Pet.create(name: 'Jack', age: 1, pet_type: 'kitten', description: 'Jack is the cutest kitten ever!', image_url: 'jack.jpg', status: 'Avaliable')

