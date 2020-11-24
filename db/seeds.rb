require 'date'

SportsClass.destroy_all
Trainer.destroy_all
User.destroy_all
puts 'deleting all previous 🌱!'

# USER SEEDS
adham = User.create!(
  email: "adham@gmail.com",
  password: "adham123",
  first_name: "Adham",
  last_name: "Jaafar",
  bio: "I live, breathe, eat sports",
  language: "English",
)

cassy = User.create!(
  email: "cassy@gmail.com",
  password: "cassy123",
  first_name: "Cassy",
  last_name: "Dodd",
  bio: "I live, breathe, eat sports",
  language: "English",
  )

dorian = User.create!(
  email: "dw.debriano@gmail.com",
  password: "dorian123",
  first_name: "Dorian",
  last_name: "Wilson",
  bio: "I live, breathe, eat sports",
  language: "English",

  )

edoardo = User.create!(
  email: "edoardo@gmail.com",
  password: "edo123",
  first_name: "Edoardo",
  last_name: "Maraia",
  bio: "I live, breathe, eat sports",
  language: "English",
  )

sarah = User.create!(
  email: "sarah@gmail.com",
  password: "sarah123",
  first_name: "Sarah",
  last_name: "Smith",
  bio: "I live, breathe, eat sports",
  language: "English",
)
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

trainer_5 = Trainer.new(
  bio: "In my classes you will feel the burn!",
  sport_category: "Yoga",
  city: "London",
  user: sarah,
)
# TRAINER PIC
trainer_5.save!

# CLASS SEEDS

sports_class_1 = SportsClass.new(
    title: "Monday Morning Wake-up",
    description: "Start your week right with this slow-burner!",
    date_time: DateTime.new(2020,11,23,7),
    duration: "50 mins",
    category: "Cardio",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: false,
    language: "English",
    trainer: trainer_1,
)

# CLASS PIC/VIDEO?
sports_class_1.save!

sports_class_2 = SportsClass.new(
    title: "Tuesday Flex",
    description: "Lets make the week even better together",
    date_time: DateTime.new(2020,11,24,17),
    duration: "60 mins",
    category: "Yoga",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: false,
    language: "English",
    trainer: trainer_2,
)

# CLASS PIC/VIDEO?
sports_class_2.save!

sports_class_3 = SportsClass.new(
    title: "Wednesday Whirl",
    description: "Lets move!",
    date_time: DateTime.new(2020,11,25,13),
    duration: "30 mins",
    category: "Zumba",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: false,
    language: "English",
    trainer: trainer_3,
)

# CLASS PIC/VIDEO?
sports_class_3.save!


sports_class_4 = SportsClass.new(
    title: "Feel it Friday",
    description: "Burn off the weeks stress and frustrations!",
    date_time: DateTime.new(2020,11,27,18),
    duration: "40 mins",
    category: "HITT",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Advanced",
    equipment: false,
    language: "English",
    trainer: trainer_4,
)

# CLASS PIC/VIDEO?
sports_class_4.save!

sports_class_5 = SportsClass.new(
    title: "Saturday Start",
    description: "A smooth start to your stress-free weekend",
    date_time: DateTime.new(2020,11,28,8),
    duration: "90 mins",
    category: "Yoga",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Intermediate",
    equipment: false,
    language: "English",
    trainer: trainer_5,
)

# CLASS PIC/VIDEO?
sports_class_5.save!

puts 'new seeds added!'



























