require 'date'
require "open-uri"


SportsClass.destroy_all
Trainer.destroy_all
puts "destroy users"
User.destroy_all
puts 'deleting all previous 🌱!'

# USER SEEDS
file = URI.open('https://avatars0.githubusercontent.com/u/68596947?s=400&u=f18b9637ef88a32845322a4167ee2d6fe0333c38&v=4')

adham = User.new(
  email: "adham@gmail.com",
  password: "adham123",
  first_name: "Adham",
  last_name: "Jaafar",
  bio: "I live, breathe, eat sports",
  language: "English",
  )
adham.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
adham.save!

file = URI.open('https://avatars1.githubusercontent.com/u/68464312?s=400&u=9cca4a525d11b96017a6892fac06a8b708868b71&v=4')

cassy = User.new(
  email: "cassy@gmail.com",
  password: "cassy123",
  first_name: "Cassy",
  last_name: "Dodd",
  bio: "I live, breathe, eat sports",
  language: "English",
  )
cassy.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
cassy.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606231422/Dorian-profile-pic-square_zkwni6.jpg')

dorian = User.new(
  email: "dw.debriano@gmail.com",
  password: "dorian123",
  first_name: "Dorian",
  last_name: "Wilson",
  bio: "I live, breathe, eat sports",
  language: "English",
  )
dorian.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
dorian.save!

file = URI.open('https://avatars0.githubusercontent.com/u/56122943?s=400&u=cc0448ec43408ed8f5a061ef369d45b4d8f720e8&v=4')

edoardo = User.new(
  email: "edoardo@gmail.com",
  password: "edo123",
  first_name: "Edoardo",
  last_name: "Maraia",
  bio: "I live, breathe, eat sports",
  language: "English",
  )
edoardo.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
edoardo.save!

# TRAINER SEEDS

trainer_1 = Trainer.new(
  bio: "A personal trainer who can help you shift that unwanted lockdown weight!",
  sport_category: "Cardio",
  city: "Berlin",
  user: edoardo,
)
# TRAINER PIC
trainer_1.save!

trainer_2 = Trainer.new(
  bio: "Come join my class and release the stress of your week",
  sport_category: "Yoga",
  city: "Paris",
  user: dorian,
)
# TRAINER PIC
trainer_2.save!

trainer_3 = Trainer.new(
  bio: "Let's dance!",
  sport_category: "Zumba",
  city: "Copenhagen",
  user: cassy,
)
# TRAINER PIC
trainer_3.save!

trainer_4 = Trainer.new(
  bio: "In my classes you will feel the burn!",
  sport_category: "HITT",
  city: "Amsterdam",
  user: adham,
)
# TRAINER PIC
trainer_4.save!

# CLASS SEEDS
file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606303073/an6ys6litaabmulfs6hmzkz7zajn.jpg')
sports_class_1 = SportsClass.new(
    title: "Monday Morning Wake-up",
    description: "Start your week right with this slow-burner!",
    date_time: DateTime.new(2020,11,23,7),
    duration: "50 mins",
    category: "Cardio",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_1,
)
sports_class_1.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_1.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606303073/an6ys6litaabmulfs6hmzkz7zajn.jpg')
sports_class_2 = SportsClass.new(
    title: "Tuesday Flex",
    description: "Lets make the week even better together",
    date_time: DateTime.new(2020,11,24,17),
    duration: "60 mins",
    category: "Yoga",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_2,
)

sports_class_2.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_2.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606487059/raphael-nast-2ia6IXXNGwY-unsplash_qki4wo.jpg')
sports_class_3 = SportsClass.new(
    title: "Ballet Fit",
    description: "Look and feel like a dancer with Cassy. Her workout consists of ballet and palettes, which will help sculpt and shape your body. You won't be twirling or prancing, but you will feel the burn!",
    date_time: DateTime.new(2020,11,25,13),
    duration: "30 mins",
    category: "dance",
    difficulty_level: 4,
    sweat_level: 3,
    experience_level: "Advanced",
    equipment: true,
    language: "English",
    trainer: trainer_3,
)

sports_class_3.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_3.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606486726/clem-onojeghuo-n6gnCa77Urc-unsplash_h7uuak.jpg')
sports_class_4 = SportsClass.new(
    title: "Feel it Friday",
    description: "Burn off the weeks stress and frustrations!",
    date_time: DateTime.new(2020,11,27,18),
    duration: "40 mins",
    category: "HITT",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_4,
)


sports_class_4.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_4.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606486726/tyler-nix-Y1drF0Y3Oe0-unsplash_dorywz.jpg')
sports_class_5 = SportsClass.new(
    title: "Lunch Break Energizer",
    description: "No time for both lunch break and a workout? Those days are over when you try the new 10-minute version of Adham's popular lunch break workout!",
    date_time: DateTime.new(2020,11,27,18),
    duration: "40 mins",
    category: "HITT",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_4,
)


sports_class_5.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_5.save!

puts 'new seeds planted!'
