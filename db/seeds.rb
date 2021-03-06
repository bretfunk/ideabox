Idea.destroy_all
Image.destroy_all
Category.destroy_all
User.destroy_all

USERS = ["Matthew", "Mark", "Luke", "John", "Ringo"]
IDEAS = ["Apples", "Oranges", "Pears", "Blueberries", "Milk", ]
IMAGES = ["https://robohash.org/1","https://robohash.org/2","https://robohash.org/3","https://robohash.org/4","https://robohash.org/5"]
CATEGORIES = ["Store", "Work", "Home", "Turing", "Trip", "Fun"]

CATEGORIES.each do |name|
  Category.create!(name: name)
end

USERS.each do |name|
  user = User.create!(username: name, password: IDEAS.sample)
  3.times do |num|
    user.ideas.find_or_create_by!(idea: IDEAS.sample, category_id: (rand(5) + 1))
  end
end

IMAGES.each do |image|
  counter = rand(100)
  Image.create!(url: image, name: "Robot #{counter}")
end

User.create(username: "bret", password: "123")
User.create(username: "admin", password: "123", role: 1)
