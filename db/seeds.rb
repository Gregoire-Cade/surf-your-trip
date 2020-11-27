require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Review.destroy_all
Spot.destroy_all
User.destroy_all

puts "Creating users..."
gregoire = User.create(nickname: "greg", location: "152 Bethnal Green Road", email: "gregoirecade.fr@gmail.com", password: "password")
karolina = User.create(nickname: "karo", location: "67 Palmerston Road", email: "karolinalangner1@gmail.com", password: "123456")
anne = User.create(nickname: "anne", location: "123 Liverpool Street", email: "anne@gmail.com", password: "123456")

puts "Finished!"

# puts "Creating spots..."
file1 = URI.open('https://www.surfholidays.com/assets/images/blog/2015-09-08-Trestles.jpg')
file2 = URI.open('https://www.surfertoday.com/images/stories/hossegor.jpg')
cap_ferret = Spot.create!(name: "Cap Ferret", location: "Lège-Cap-Ferret, Gironde, France", country: "France", level: "improver", user: gregoire, description: "Cap Ferret is a smart seaside resort at the tip of the Cap Ferret peninsula that separates the Atlantic Ocean from the Bay of Arcachon. Hidden among pine trees with its fishermen and oyster farmers in their traditional wooden huts, Cap Ferret harks back to a bygone era.", beach_type: "sandy", about_location: "blablabalbalbabla", punchline: "Try local oysters, you won't regret")
cap_ferret.photos.attach(io: file1, filename: '2015-09-08-Trestles.jpg', content_type: 'image/jpg')
cap_ferret.photos.attach(io: file2, filename: 'hossegor.jpg', content_type: 'image/jpg')
review1 = Review.create(user: gregoire, title: "Best surf spot in South West of France", content: "This surf spot is really good for beginners as the wind does not go crazy!", rating: 4, spot: cap_ferret)
review1photo = URI.open('https://www.surfertoday.com/images/stories/hossegor.jpg')
review1.photo.attach(io: review1photo, filename: 'hossegor.jpg', content_type: 'image/jpg')

file2 = URI.open('https://www.surfertoday.com/images/stories/hossegor.jpg')
koszalin = Spot.create!(name: "Koszalin", location: "Wladyslawowo", country: "Poland", level: "beginner", user: karolina, description: "Dabki (Koszalin), Leba and Wladyslawowo are also quite interesting beach breaks waiting for the Central European surfers. Sopot and Wladyslawowo are probably the most important wave riding centers in Poland.", beach_type: "sandy", about_location: "blablabalbalbabla", punchline: "Try local oysters, you won't regret")
koszalin.photos.attach(io: file2, filename: 'hossegor.jpg', content_type: 'image/jpg')
review2 = Review.create(user: karolina, title: "Look at the waves!", content: "Best spot in town  Best spot in town Best spot in town", rating: 5, spot: koszalin)
review2photo = URI.open('https://www.surfertoday.com/images/stories/hossegor.jpg')
review2.photo.attach(io: review2photo, filename: 'hossegor.jpg', content_type: 'image/jpg')

file1 = URI.open('https://www.wallpaperup.com/uploads/wallpapers/2014/04/14/332379/39bf484bab13394d6a70ed26ae7ed8c3.jpg')
file2 = URI.open('https://checkyeti.imgix.net/images/optimized/surf-lessons-at-gamboa-beach-in-peniche-go-4-surf-peniche-92.jpg')
sennen_cove = Spot.create!(name: "Sennen Cove", location: "Newquay", country: "UK", level: "improver", user: anne, description: "A gorgeous swathe of pale sand and crystal-clear sea curves from Sennen Cove up towards Gwynver Beach, and provides the most consistent beach breaks in Cornwall", beach_type: "sandy", about_location: "blablabalbalbabla", punchline: "Try local oysters, you won't regret")
sennen_cove.photos.attach(io: file1, filename: 'glossary-of-surfing.jpg', content_type: 'image/jpg')
sennen_cove.photos.attach(io: file2, filename: 'surf-lessons-at-gamboa-beach-in-peniche-go-4-surf-peniche-92.jpg', content_type: 'image/jpg')
review3 = Review.create(user: anne, title: "Best surf spot in the UK, love Cornwall", content: "This is the best spot I've been to in the UK, really amazing", rating: 5, spot: sennen_cove)
review3photo = URI.open('https://wavegarden.com/wp-content/uploads/2019/11/wavegarden-cove-Melburne-01.jpg')
review3.photo.attach(io: review3photo, filename: 'wavegarden-cove-Melburne-01.jpg', content_type: 'image/jpg')


photo1 = URI.open('https://media-cdn.tripadvisor.com/media/photo-c/1280x250/02/0b/5e/ca/filename-dsc-0153-jpg.jpg')
jeffbay = Spot.create!(name: "Jeffreys Bay", location: "Jeffreys Bay", country: "SA", level: "improver", user: karolina, description: "Most noted for producing the best right hand surf break in the world, the streets of the town bustle from dawn to dusk with those hoping to live out their own Endless Summer dreams.", beach_type: "sandy", about_location: "Jeffreys Bay is a town located in the Eastern Cape province of South Africa. The town is situated just off the N2 Highway, about 75 km southwest of Port Elizabeth", punchline: "The picturesque surfing mecca of Jeffreys Bay boasts a considerable reputation that stretches far and wide.")
jeffbay.photos.attach(io: photo1, filename: 'jeffreys-bay-south-africa.jpg', content_type: 'image/jpg')
review_karo1 = Review.create(user: gregoire, title: "Best surf spot in SA!", content: "This surf spot is great for experienced surfers, the waves get really big!", rating: 5, spot: jeffbay)
review1photo = URI.open('https://img.theculturetrip.com/1440x/wp-content/uploads/2018/06/gctp0032-jeffreys-bay-south-africa-myers107.jpg')
review1.photo.attach(io: review1photo, filename: 'hossegor.jpg', content_type: 'image/jpg')


file1 = URI.open('https://dl16txa2az7pk.cloudfront.net/cms/fileadmin/_processed_/9/8/csm_Ellie-Jean-Coffey-Maldives-Niyama-Vodi_0886b5aa6d.jpg')
file2 = URI.open('https://offloadmedia.feverup.com/secretldn.com/wp-content/uploads/2020/07/20113519/best-surf-beaches-uk-woolacombe1.jpg')
nazare = Spot.create!(name: "Nazare", location: "Nazaré, Portugal", country: "Portugal", level: "expert", user: karolina, description: "There are several beach breaks in and around Nazaré. Waves are nice and powerful here. Nazaré works in pretty much all swells and sized. Offshore Easterlys.", beach_type: "sandy", about_location: "Portugal is great", punchline: "Try pasteis de nata, you won't regret")
nazare.photos.attach(io: file1, filename: 'csm_Ellie-Jean-Coffey-Maldives-Niyama-Vodi_0886b5aa6d.jpg', content_type: 'image/jpg')
nazare.photos.attach(io: file2, filename: 'best-surf-beaches-uk-woolacombe1.jpg', content_type: 'image/jpg')
review3 = Review.create(user: anne, title: "Best surf spot in Portugal, love Nazare", content: "This surf spot got the biggest waves in Europe", rating: 5, spot: nazare)
review3photo = URI.open('https://ohairesorts.com/nazare/wp-content/uploads/2020/06/surf-en-nazare.jpg')
review3.photo.attach(io: review3photo, filename: 'surf-en-nazare.jpg', content_type: 'image/jpg')

photo2 = URI.open('https://cdn.raftingbali.net/wp-content/uploads/2013/05/Balangan-Beach-Bali-1.jpg')
balangan = Spot.create!(name: "Balangan Beach", location: "Balangan", country: "Indonesia", level: "expert", user: gregoire, description: "Thanks to the advocacy of local surf icon Kim Bradley, AKA the fly, Balangan was preserved and remains one of the many left-handers along the Bukit. On smaller swells with an outgoing tide, you can count on steep, peaky, left-handers. Typically Balangan will hold a steep wall for a short ride before some sections close out. At times but under perfect conditions, it has been known to connect the whole length of the reef (over 300 meters). Choose your peak and tide accordingly, although Balangan can be surfed on all tides it is the more experienced surfers that only surf it on low tides and big swells. While not necessarily recommended for beginner surfers it is mellow on a higher tide and small swell. If you can keep up your speed to make the sections (and it doesn’t close out), you’re in for an open shoulder ripe for plenty of maneuvers.", beach_type: "sandy", about_location: "Historically nestled into sleepy farmland on the Bukit peninsula, new development makes Balangan a bit more exciting than it once was. Today, Balangan beach is bordered by golf courses with breathtaking sea views of pristine beaches and limestone cliffs.", punchline: "Feel this hot clean white sand... :ensoleillé:")
balangan.photos.attach(io: photo2, filename: 'Balangan-Beach-Bali.jpg', content_type: 'image/jpg')
review_greg1 = Review.create(user: karolina, title: "MUST GO!", content: "Great time surfing, awesome bars in the area also worth visiting", rating: 4, spot: balangan)

photo3 = URI.open('https://www.seenicwander.com/wp-content/uploads/2019/07/Uluwatu-15-768x576.jpg')
photo4 = URI.open('https://www.seenicwander.com/wp-content/uploads/2019/07/Uluwatu-4-1024x768.jpg')
uluwatu = Spot.create(name: "Uluwatu Beach", location: "Uluwatu", country: "Indonesia", level: "beginner", user: karolina, description: "", beach_type: "sandy", about_location: "blablabalbalbabla", punchline: "Try local oysters, you won't regret")
uluwatu.photos.attach(io: photo3, filename: 'uluwatu1.jpg', content_type: 'image/jpg')
uluwatu.photos.attach(io: photo4, filename: 'uluwatu2.jpg', content_type: 'image/jpg')
review4 = Review.create(user: gregoire, title: "Perfect for begginers", content: "One of the best beaches in Indonesia! 5 Stars!", rating: 5, spot: uluwatu)
review4photo = URI.open('https://bluewavesmorocco.com/wp-content/uploads/2017/11/blue-waves-sul-lifestyle.jpg')
review4.photo.attach(io: review4photo, filename: 'surferrs.jpg', content_type: 'image/jpg')
review5 = Review.create(user: anne, title: "Look at these waves! 🏄‍♀️", content: "I stayed in Uluwatu last summer and it was just great. I'm taking off one stars because there were moments when it got a bit too crowded.", rating: 4, spot: uluwatu)
review5photo = URI.open('https://www.kalonsurf.com/wp-content/uploads/2018/07/headstand-while-surfing.jpg')
review5.photo.attach(io: review5photo, filename: 'surfer.jpg', content_type: 'image/jpg')

puts "Finished!"
