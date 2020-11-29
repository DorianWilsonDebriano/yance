require 'date'
require "open-uri"

puts "destroying all bookings"
Booking.destroy_all
puts "destroying all reviews"
Review.destroy_all
puts "destroying all classes"
SportsClass.destroy_all
puts "destroying all trainers"
Trainer.destroy_all
puts "destroying all users"
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
file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606491396/dane-wetton-t1NEMSm1rgI-unsplash_ksd3vg.jpg')
sports_class_1 = SportsClass.new(
    title: "Monday Morning Wake-up",
    description: "Start your week right with this slow-burner!",
    date_time: DateTime.new(2020,11,23,7),
    duration: "50 mins",
    category: "Stretching",
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
    sweat_level: 2,
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
    date_time: DateTime.new(2020,12,01,13),
    duration: "30 mins",
    category: "dance",
    difficulty_level: 4,
    sweat_level: 4,
    experience_level: "Advanced",
    equipment: true,
    language: "English",
    trainer: trainer_3,
)

sports_class_3.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_3.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606491474/alexander-redl-d3bYmnZ0ank-unsplash_cp8d5d.jpg')
sports_class_4 = SportsClass.new(
    title: "Feel it Friday",
    description: "Burn off the weeks stress and frustrations!",
    date_time: DateTime.new(2020,11,29,18),
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

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606491307/jonathan-borba-lrQPTQs7nQQ-unsplash_rrjtqc.jpg')
sports_class_5 = SportsClass.new(
    title: "Lunch Break Energizer",
    description: "No time for both lunch break and a workout? Those days are over when you try the new 10-minute version of Adham's popular lunch break workout!",
    date_time: DateTime.new(2020,11,27,20),
    duration: "40 mins",
    category: "HITT",
    difficulty_level: 2,
    sweat_level: 2,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_4,
)


sports_class_5.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_5.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606389633/8zqw2ptcu4sonnqcpdzpp04j0ekl.jpg')
sports_class_6 = SportsClass.new(
    title: "Pure Pilates",
    description: "Your everyday go-to pilates flow. Perfect for all levels this class is designed to lengthen, align and sculpt. Edoardo will take time in these class to focus on technique and breathing!",
    date_time: DateTime.new(2020,11,30,15),
    duration: "40 mins",
    category: "Pilates",
    difficulty_level: 2,
    sweat_level: 2,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_1,
)


sports_class_6.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_6.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606486727/emily-sea-coiWR0gT8Cw-unsplash_vzy3ry.jpg')
sports_class_7 = SportsClass.new(
    title: "Yoga Vinyasa",
    description: "Vinyasa flow is a strong and well rounded practice that includes core conditioning, flexibility, balance and movement.",
    date_time: DateTime.new(2020,12,29,16),
    duration: "90 mins",
    category: "Yoga",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Intermediate",
    equipment: true,
    language: "English",
    trainer: trainer_1,
)


sports_class_7.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_7.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606490125/taco-fleur-qxoOajPS55U-unsplash_iyiup8.jpg')
sports_class_8 = SportsClass.new(
    title: "Kettle Bell Crush",
    description: "This is another hard-hitting workout by the kettlebell king. Tyler's workout will define every inch of your body.",
    date_time: DateTime.new(2020,12,30,13),
    duration: "50 mins",
    category: "Resistance Training",
    difficulty_level: 4,
    sweat_level: 3,
    experience_level: "Advanced",
    equipment: true,
    language: "English",
    trainer: trainer_2,
)


sports_class_8.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_8.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606490631/victor-freitas-WvDYdXDzkhs-unsplash_e9kbsd.jpg')
sports_class_9 = SportsClass.new(
    title: "Iron Bars",
    description: "There's nothing easy about Adham's workout, but it's well worth it! You'll be doing a whole lot of lifting, deadlift and squats using your barbell Now let's get you summer ready!",
    date_time: DateTime.new(2020,12,5,13),
    duration: "50 mins",
    category: "Resistance Training",
    difficulty_level: 5,
    sweat_level: 5,
    experience_level: "Advanced",
    equipment: true,
    language: "English",
    trainer: trainer_4,
)


sports_class_9.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_9.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606491710/madison-lavern-4gcqRf3-f2I-unsplash_ljr7uu.jpg')
sports_class_10 = SportsClass.new(
    title: "Just Relax",
    description: "Sometimes we just need relax and reboot. Come away with us and free your mind of any worries. Dorian's workout is a combination of yoga and stretching which will activate and relax your muscles.",
    date_time: DateTime.new(2020,12,7,20),
    duration: "60 mins",
    category: "Yoga",
    difficulty_level: 2,
    sweat_level: 2,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_2,
)


sports_class_10.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_10.save!

puts 'new seeds planted!'
