require 'rails_helper'

describe "User creates a new idea" do
  scenario "a user can create a new idea" do
    # Category.create(name: "Grocery Store")
    category = create(:category)

    visit new_idea_path

    fill_in "Idea", with: "Soylent"
    #select category.name
    click_on "Submit"

    visit ideas_path

    expect(page).to have_content("Soylent")
  end
end
