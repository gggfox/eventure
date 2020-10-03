# Create a main sample user.
# bang operator (!) makes it so you dont need to do User.save
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "12345678",
             password_confirmation: "12345678",
             admin:     true)
