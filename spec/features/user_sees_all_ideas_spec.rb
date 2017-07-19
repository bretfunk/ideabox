require 'rails_helper'

describe "User creates a new idea" do
  scenario "a user can create a new idea" do
    # category = Category.create(name: "Grocery Store")
    # category.ideas.create(idea: "Apples")
    # category.ideas.create(idea: "Bananas")
    # category.ideas.create(idea: "Soylent")
    category1 = create(:category)
    category2 = create(:category)
    category3 = create(:category)

    visit ideas_path

    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
    expect(page).to have_content(category3.name)
  end
end
