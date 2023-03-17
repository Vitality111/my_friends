# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   MyFriend.create([{ First_name: "Star Wars", }, { First_name: "Lord of the Rings" }])
MyFriend.destroy_all
5.times do 
  MyFriend.create(First_name: "John", Last_name: "Doe ")
end 
p "Created #{MyFriend.count}"
  #how to seed?``
#   Character.create(name: "Luke", movie: movies.first)
