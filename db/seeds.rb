require 'date'
require "open-uri"

puts "uprooting all subscriptions 🌱"
Subscription.destroy_all
puts "uprooting all memberships 🌱"
Membership.destroy_all
puts "uprooting all bookings 🌱"
ClassBooking.destroy_all
puts "uprooting all reviews 🌱"
Review.destroy_all
puts "uprooting all classes 🌱"
SportsClass.destroy_all
puts "uprooting all trainers 🌱"
Trainer.destroy_all
puts "uprooting all users 🌱"
User.destroy_all
puts 'all previous seeds deleted 🌱!'

# MEMBERSHIP SEEDS
light = Membership.new(
  title: "Yance Starter Package",
  description: "Perfect for working out once a week, start your free 14 day trial now.",
  expiration_date: Time.now + 30.days,
  credits: 4,
  price: 19.99,
  )
light.save!

medium = Membership.new(
  title: "Yance Routine Package",
  description: "Perfect for working out twice a week, start your free 14 day trial now.",
  expiration_date: Time.now + 30.days,
  credits: 8,
  price: 29.99,
  )
medium.save!

unlimited = Membership.new(
  title: "Yance Experience Package",
  description: "Unlimited access to live classes, start your free 14 day trial now.",
  expiration_date: Time.now + 30.days,
  credits: 20,
  price: 39.99,
  )
unlimited.save!

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
  bio: "I love to both attend classes on Yance and offer them!",
  language: "English, German",
  )
cassy.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
cassy.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606231422/Dorian-profile-pic-square_zkwni6.jpg')

dorian = User.new(
  email: "dw.debriano@gmail.com",
  password: "dorian123",
  first_name: "Dorian",
  last_name: "Wilson",
  bio: "Feel free to join my classes, hope to see you there!",
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
  language: "English, Italian",
  )
edoardo.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
edoardo.save!

# TRAINER SEEDS

trainer_1 = Trainer.new(
  bio: "I have always had a passion for sports and in the past couple of years flexibility has become my speciality, in both yoga and pilates.",
  sport_category: "Flexibility",
  city: "Berlin",
  user: edoardo,
)
# TRAINER PIC
trainer_1.save!

trainer_2 = Trainer.new(
  bio: "Join my class and release the stress of your week, when we have healthy bodies, we have healthy minds. It's time to unlock your enlightenment.",
  sport_category: "Yoga",
  city: "Paris",
  user: dorian,
)
# TRAINER PIC
trainer_2.save!

trainer_3 = Trainer.new(
  bio: "I like to create an inclusive classroom environment, where we can shape-up our minds and body together, with a mixture of cardio and stretching.",
  sport_category: "Full Body",
  city: "Frankfurt",
  user: cassy,
)
# TRAINER PIC
trainer_3.save!

trainer_4 = Trainer.new(
  bio: "In my classes you will feel the burn! For those who want muscle definition and excellent core strength with the tricks I learned while in the army.",
  sport_category: "Cardio",
  city: "Amsterdam",
  user: adham,
)
# TRAINER PIC
trainer_4.save!

# CLASS SEEDS
file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606998688/9wzaptuceheoou5cvfx2yuq6sn2d.jpg')
sports_class_1 = SportsClass.new(
    title: "Kick Start",
    description: "Let's kick start our way into the coming week right! Excellent energizer, challenges your technique, endurance, and above all, concentration. This class will give you the ultimate kick to boost your fitness.",
    date_time: DateTime.new(2020,12,6,18),
    duration: "60 mins",
    category: "Cardio",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Good",
    equipment: true,
    language: "English",
    trainer: trainer_3,
)
sports_class_1.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_1.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606998664/wv24j0stkk7p2jciyk6fe8nr5qqe.jpg')
sports_class_2 = SportsClass.new(
    title: "Monday Morning Wake-up",
    description: "Before you set off to work or start your day, let's start your week right with this slow-burner! We'll engage your muscles and wake-up our bodies together, giving you the best boost for the week.",
    date_time: DateTime.new(2020,12,7,7),
    duration: "50 mins",
    category: "Pilates",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_1,
)
sports_class_2.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_2.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606998661/xnujyerxzshv41dpu2w2ym1hn743.jpg')
sports_class_3 = SportsClass.new(
    title: "Tuesday Flex",
    description: "Lets make the week even better together and work off the Monday blues. We'll focus on our positions and balance and achieve the perfect downward dog!",
    date_time: DateTime.new(2020,12,8,17),
    duration: "60 mins",
    category: "Yoga",
    difficulty_level: 2,
    sweat_level: 2,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_2,
)

sports_class_3.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_3.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606998659/bz3pc03zj6h9rpr5kakfnib1n3ns.jpg')
sports_class_4 = SportsClass.new(
    title: "Ballet Fit",
    description: "Look and feel like a dancer with me. My workout consists of ballet and palettes, which will help sculpt and shape your body. You won't be twirling or prancing, but you will feel the burn!",
    date_time: DateTime.new(2020,12,9,13),
    duration: "30 mins",
    category: "Cardio",
    difficulty_level: 3,
    sweat_level: 3,
    experience_level: "Advanced",
    equipment: true,
    language: "English",
    trainer: trainer_3,
)

sports_class_4.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_4.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606998656/pb43iaqvlg4jax3qhcbavgy8oce9.jpg')
sports_class_5 = SportsClass.new(
    title: "Feel it Friday",
    description: "Push off the week's stress and frustrations! We will be focusing on our glutes and calves and thighs with squats and lunges, get ready for the burn.",
    date_time: DateTime.new(2020,12,11,18),
    duration: "40 mins",
    category: "Strength",
    difficulty_level: 2,
    sweat_level: 3,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_4,
)


sports_class_5.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_5.save!

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606998653/3l62b0r7nqihkhzlogkxqkoqrxun.jpg')
sports_class_6 = SportsClass.new(
    title: "Lunch Break Energizer",
    description: "No time for both a lunch break and a workout? Those days are over when you try the new 20-minute version of my popular lunch break workout!",
    date_time: DateTime.new(2020,12,10,20),
    duration: "20 mins",
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

file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606998649/exn35ix4g43dznj03w5vl19ltiej.jpg')
sports_class_7 = SportsClass.new(
    title: "Pure Pilates",
    description: "Your everyday go-to pilates flow. Perfect for all levels this class is designed to lengthen, align and sculpt. I will take time in these class to focus on technique and breathing!",
    date_time: DateTime.new(2020,12,12,15),
    duration: "40 mins",
    category: "Pilates",
    difficulty_level: 2,
    sweat_level: 2,
    experience_level: "Beginner",
    equipment: true,
    language: "English",
    trainer: trainer_1,
)


sports_class_7.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
sports_class_7.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606913765/pexels-cottonbro-4327018_e0qfzp.jpg')
# sports_class_8 = SportsClass.new(
#     title: "Yoga Vinyasa",
#     description: "Vinyasa flow is a strong and well rounded practice that includes core conditioning, flexibility, balance and movement.",
#     date_time: DateTime.new(2020,12,9,16),
#     duration: "90 mins",
#     category: "Yoga",
#     difficulty_level: 2,
#     sweat_level: 3,
#     experience_level: "Good",
#     equipment: true,
#     language: "English",
#     trainer: trainer_2,
# )


# sports_class_8.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_8.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606914512/pexels-ketut-subiyanto-4720238_cbiyvx.jpg')
# sports_class_9 = SportsClass.new(
#     title: "Kettle Bell Crush",
#     description: "This is another hard-hitting workout by the kettlebell king. This workout will define every inch of your body, from head to toe, not for the faint hearted! 10kg kettlebell or equivalent needed as equiptment.",
#     date_time: DateTime.new(2020,12,30,13),
#     duration: "50 mins",
#     category: "Strength",
#     difficulty_level: 3,
#     sweat_level: 3,
#     experience_level: "Advanced",
#     equipment: true,
#     language: "English",
#     trainer: trainer_4,
# )


# sports_class_9.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_9.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606490631/victor-freitas-WvDYdXDzkhs-unsplash_e9kbsd.jpg')
# sports_class_10 = SportsClass.new(
#     title: "Iron Bars",
#     description: "There's nothing easy about my workout, but it's well worth it! You'll be doing a whole lot of lifting and squats using your barbell Now let's get you summer ready!",
#     date_time: DateTime.new(2020,12,5,13),
#     duration: "50 mins",
#     category: "Strength",
#     difficulty_level: 3,
#     sweat_level: 3,
#     experience_level: "Advanced",
#     equipment: true,
#     language: "English",
#     trainer: trainer_4,
# )


# sports_class_10.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_10.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606910224/pexels-cottonbro-4325445_zyracp.jpg')
# sports_class_11 = SportsClass.new(
#     title: "Just Relax",
#     description: "Sometimes we just need relax and reboot. Come away with us and free your mind of any worries. My workout is a combination of yoga and stretching which will activate and relax your muscles.",
#     date_time: DateTime.new(2020,12,6,20),
#     duration: "60 mins",
#     category: "Yoga",
#     difficulty_level: 1,
#     sweat_level: 1,
#     experience_level: "Beginner",
#     equipment: true,
#     language: "English",
#     trainer: trainer_2,
# )


# sports_class_11.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_11.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606651671/pexels-karolina-grabowska-4498154_t6btmr.jpg')
# sports_class_12 = SportsClass.new(
#     title: "Hula whoop",
#     description: "Abs don't come easy, but the simplicity of the hula hoop should get those obliques standing out and start burning the notoriously hard to shift belly fat! Let's get our cores stronger and defined!",
#     date_time: DateTime.new(2020,12,27,13),
#     duration: "45 mins",
#     category: "Cardio",
#     difficulty_level: 1,
#     sweat_level: 3,
#     experience_level: "Beginner",
#     equipment: true,
#     language: "English",
#     trainer: trainer_3,
# )

# sports_class_12.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_12.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606907454/pexels-ketut-subiyanto-4473635_lqoicw.jpg')
# sports_class_13 = SportsClass.new(
#     title: "Pilates Pause",
#     description: "Want to join me for a breather? This class is aimed as beginners, strengthening muscles and becoming aware of our bodies We'll start with lengthening and build up to our first positions!.",
#     date_time: DateTime.new(2020,12,24,15),
#     duration: "60 mins",
#     category: "Pilates",
#     difficulty_level: 1,
#     sweat_level: 1,
#     experience_level: "Beginner",
#     equipment: true,
#     language: "English",
#     trainer: trainer_1,
# )

# sports_class_13.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_13.save!


# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606907448/pexels-polina-tankilevitch-3735532_ahirth.jpg')
# sports_class_14 = SportsClass.new(
#     title: "Muscle Release",
#     description: "Tight muscles? Stressed? Sore from working out? With me, we can loosen tightness and become limber once more!",
#     date_time: DateTime.new(2020,12,26,19),
#     duration: "30 mins",
#     category: "Stretching",
#     difficulty_level: 2,
#     sweat_level: 1,
#     experience_level: "Beginner",
#     equipment: true,
#     language: "English",
#     trainer: trainer_3,
# )

# sports_class_14.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_14.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606908088/pexels-cottonbro-4761352_ongvpe.jpg')
# sports_class_15 = SportsClass.new(
#     title: "Hop, Skip to the Beat",
#     description: "Stress busting, heart pumping class! Prepare to make your fat cry, you'll need to have a skipping rope and be ready to sweat a LOT",
#     date_time: DateTime.new(2020,12,26,19),
#     duration: "20 mins",
#     category: "Cardio",
#     difficulty_level: 3,
#     sweat_level: 3,
#     experience_level: "Advanced",
#     equipment: true,
#     language: "English",
#     trainer: trainer_4,
# )

# sports_class_15.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_15.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606910228/pexels-elly-fairytale-4662469_ipll4u.jpg')
# sports_class_16 = SportsClass.new(
#     title: "Kundalini Yoga",
#     description: "Awaken the Kundalini - we can work on the resting posture together as well as our breathing techniques.",
#     date_time: DateTime.new(2020,12,27,19),
#     duration: "40 mins",
#     category: "Yoga",
#     difficulty_level: 2,
#     sweat_level: 2,
#     experience_level: "Good",
#     equipment: true,
#     language: "English",
#     trainer: trainer_2,
# )

# sports_class_16.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_16.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606913765/pexels-cottonbro-4325495_jtsped.jpg')
# sports_class_17 = SportsClass.new(
#     title: "Gentle Yoga",
#     description: "Embark on your journey with Yoga, in this class we will start at the very basics of posture and awareness of our breathing and bodies.",
#     date_time: DateTime.new(2020,12,22,19),
#     duration: "90 mins",
#     category: "Yoga",
#     difficulty_level: 1,
#     sweat_level: 1,
#     experience_level: "Beginner",
#     equipment: true,
#     language: "English",
#     trainer: trainer_2,
# )

# sports_class_17.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_17.save!

# file = URI.open('https://res.cloudinary.com/dorianwilsondebriano/image/upload/v1606909564/pexels-cliff-booth-4056723_pox47p.jpg')
# sports_class_18 = SportsClass.new(
#     title: "Flexibiliyay",
#     description: "We will sculpt long lean muscles with my stetches, let's reach for the stars!",
#     date_time: DateTime.new(2020,12,31,8),
#     duration: "40 mins",
#     category: "Stretching",
#     difficulty_level: 3,
#     sweat_level: 1,
#     experience_level: "Good",
#     equipment: true,
#     language: "English",
#     trainer: trainer_3,
# )

# sports_class_18.photo.attach(io: file, filename: 'profile_pic.jpg', content_type: 'image/jpg')
# sports_class_18.save!


puts 'new seeds planted 🌻!'
