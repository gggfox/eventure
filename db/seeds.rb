# Create a main sample user.
# bang operator (!) makes it so you dont need to do User.save
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "12345678",
             password_confirmation: "12345678",
             admin:     true)

    
99.times do|n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password="password"
    User.create!( name: name,
                  email: email,
                  password: password,
                  password_confirmation: password)
end
Category.create!( name: "test")

Event.create!(  title: "Covid Party",
                location: "MTY",
                date: "2020-11-10 00:00:00 UTC",
                desc: "incredible event description",
                price: 250,
                image_name: "party",
                category_ids: ["1"]
                )