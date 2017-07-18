require 'rails_helper'

describe "User creates a new idea" do
  scenario "a user can create a new idea" do
    Category.create(name: "Grocery Store")

    visit new_idea_path

    fill_in "Idea", with: "Soylent"
    click_on "Submit"

    visit ideas_path

    expect(page).to have_content("Soylent")
  end
end
