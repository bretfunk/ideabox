Idea.destroy_all
Image.destroy_all
Category.destroy_all


IDEAS = ["Apples", "Oranges", "Pears", "Blueberries", "Milk", "Eggs", "Cheese", "Bread", "Meat", "Soylent"]
IMAGES = ["www.image1.com", "www.image2.com", "www.image3.com", "www.image4.com", "www.image5.com", "www.image6.com", "www.image7.com", "www.image8.com", "www.image9.com"]
CATEGORIES = ["Store", "Work", "Home", "Turing", "Birthday", "Trip", "New Job", "Fun", "Life Goals"]


CATEGORIES.each do |name|
  category = Category.create!(name: name)
  puts "Created #{category.name}"
  10.times do |num|
    category.ideas.create!(idea: IDEAS.sample)
    Image.create(url: IMAGES.sample)
  end
end
