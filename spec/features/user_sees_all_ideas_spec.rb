require 'rails_helper'

describe "User creates a new idea" do
  scenario "a user can create a new idea" do
    category = Category.create(name: "Grocery Store")
    category.ideas.create(idea: "Apples")
    category.ideas.create(idea: "Bananas")
    category.ideas.create(idea: "Soylent")

    visit ideas_path

    expect(page).to have_content("Apples")
    expect(page).to have_content("Bananas")
    expect(page).to have_content("Soylent")
  end
end
