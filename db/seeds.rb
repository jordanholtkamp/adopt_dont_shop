# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
otter_shelter = Shelter.create(name: "Get Otter Here", address: "3254 Lowell Ave", city: "Denver", state:"CO", zip: 80211)
cat_shelter = Shelter.create(name: "You Cat to be Kitten Me Right Meow", address: "1939 Medina Road", city: "Bath", state:"OH", zip: 44333)

steve = otter_shelter.pets.create(image: "https://cdn.mainichi.jp/vol1/2018/05/12/20180512p2a00m0na022000p/9.jpg?4", name: 'Steve', approximate_age: 1, sex: 'Male', description: 'I am a happy otter who likes to hangout with people', status: 'Adoptable')
karen = cat_shelter.pets.create(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuBI2oxO36Tx3myc68n_Dc_wKAVX3ffuEF3-JZR02-Ifh-uwho8w&s", name: 'Karen', approximate_age: 5, sex: 'Female', description: 'I like my space!', status: 'Pending Adoption')
debby = otter_shelter.pets.create(image: "https://pbs.twimg.com/media/D3lJ-xCWsAIZ7jV.jpg", name: 'Debby', approximate_age: 4, sex: 'Female', description: 'I like to swim and float', status: 'Pending Adoption')
clark = cat_shelter.pets.create(image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2018/06/cat-217679.jpg?h=c4ed616d&itok=3qHaqQ56", name: 'Clark', approximate_age: 3, sex: 'Male', description: 'I am a cuddly kitty and I like milk', status: 'Adoptable')