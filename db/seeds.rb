require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Spot.destroy_all
User.destroy_all

puts "Creating users..."
gregoire = User.create(nickname: "greg", location: "152 Bethnal Green Road", email: "gregoirecade.fr@gmail.com", password: "password")
karolina =  User.create(nickname: "karo", location: "67 Palmerston Road", email: "karolinalangner1@gmail.com", password: "123456")

puts "Finished!"

# puts "Creating spots..."
file1 = URI.open('https://www.surfholidays.com/assets/images/blog/2015-09-08-Trestles.jpg')
file2 = URI.open('https://www.surfertoday.com/images/stories/hossegor.jpg')
cap_ferret = Spot.create(name: "Cap Ferret", location: "Lège-Cap-Ferret", level: "improver", user: gregoire)
cap_ferret.photos.attach(io: file1, filename: '2015-09-08-Trestles.jpg', content_type: 'image/jpg')
cap_ferret.photos.attach(io: file2, filename: 'hossegor.jpg', content_type: 'image/jpg')

file2 = URI.open('https://www.surfertoday.com/images/stories/hossegor.jpg')
koszalin = Spot.create(name: "Koszalin", location: "Dabki", level: "beginner", user: karolina)
koszalin.photos.attach(io: file2, filename: 'hossegor.jpg', content_type: 'image/jpg')

puts "Finished!"
