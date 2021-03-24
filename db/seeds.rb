# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

LOCATIONS = %w(
Seesaw
Merry-go-round
Swingset
Slide
Jungle gym
Chin-up bars
Sandbox
Spring rider
Trapeze rings
Playhouse
Maze
)

BULLIES = %w(
Becky
Madison
Mercedes
Heather
Amberley
Biff
Tripp
Porter
Jarrett
Thad
Shep
)

ITEMS = %w(
Slingshot
Rubberbands
Paper Airplane
Magic Ink
Crayons
Juice Box
Hoodie
Wooly Willy
Legos
Silly Putty
Game Boy
)

Location.destroy_all
Enemy.destroy_all
Item.destroy_all

11.times do |i|
  # item = Item.create!(name: ITEMS[i], description: Faker::Games::DnD.unique.melee_weapon, health_bonus: rand(1..3))
  enemy = Enemy.create!(name: BULLIES[i], bully: Faker::Fantasy::Tolkien.race, health: rand(5..10), location_id: rand(1..100), item_id: rand(1..100))
  location = Location.create!(name: LOCATIONS[i], description: Faker::Books::Dune.unique.quote, enemy_id: enemy.id)
  # enemy = Enemy.create!(name: BULLIES[i], bully: Faker::Fantasy::Tolkien.race, health: rand(5..10), location_id: location.id, item_id: item.id)
  location[:enemy_id] = enemy.id
  location.save
  # enemy[:location_id] = location.id
  # enemy.save
end
