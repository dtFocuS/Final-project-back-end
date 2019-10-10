# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Participation.destroy_all;
# Activity.destroy_all;
# User.destroy_all;

# User.create({first_name: 'Danny', last_name: 'Tseng', username: 'DanyChamp', password: "123", 
#     image: 'https://images.pexels.com/photos/2662123/pexels-photo-2662123.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', verified: true})

# User.create({first_name: 'Caleb', last_name: 'Watters', username: 'Reggie', password: "123", 
#     image: 'https://images.pexels.com/photos/759817/pexels-photo-759817.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', verified: false})

# User.create({first_name: 'Jamow', last_name: 'Lee', username: 'JamownLee', password: "123", 
#     image: 'https://images-na.ssl-images-amazon.com/images/I/61x0OFEUvUL._SY450_.jpg', verified: true})

# User.create({first_name: 'Vadim', last_name: 'jsldfjidlfkl', username: 'VadimK', password: "123", 
#     image: 'https://images.pexels.com/photos/1278566/pexels-photo-1278566.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', verified: false})

# User.create({first_name: 'Gregory', last_name: 'Morgan', username: 'GMoney', password: "123", 
#     image: 'https://images.pexels.com/photos/2220336/pexels-photo-2220336.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260', verified: false})

Activity.create({name: "picnic", description: "come join my picnic", user_id: 2, latitude: 37.808674, longitude: -122.409821, address: "Pier 39, San Francisco, CA 94133"})
Activity.create({name: "beach", description: "welcome to my beach party", user_id: 3, latitude: 37.793342, longitude: -122.396492, address: "Drumm Street, San Francisco, CA 94111"})
Activity.create({name: "volleyball", description: "play volleyball together", user_id: 4, latitude: 37.798925, longitude: -122.395119, address: "Pier 7, San Francisco, CA 94111"})
Activity.create({name: "bar", description: "happy hour come join", user_id: 5, latitude: 37.791308, longitude: -122.429092, address:"2151 Laguna Street, San Francisco, CA 94115"})