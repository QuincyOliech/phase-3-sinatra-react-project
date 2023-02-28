puts "🌱 Seeding spices..."

# Seed your database here

#create hackathon instance 
h1 = Hackathon.create(
    image_url: "https://images.unsplash.com/photo-1640891175384-e599abd85c6d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80",
    topic: "Sinatra Hackathon",
    description: "Sinatra Application for All",
    location: "Nairobi, Ngong Lane",
    datetime: "02/03/2023 12:00:00" 
)

#create user instance 
u1 = User.create(
    fullname: "Jane Doe",
    email: "jdoe@example.com",
    phonenumber: "0723567865",
    languages: "JavaScript, Python, Ruby, C++",
    role: "Backend Developer"
)
#create event instance
e1 = Event.create(
    user_id: u1.id,
    hackathon_id: h1.id
)


puts "✅ Done seeding!"
