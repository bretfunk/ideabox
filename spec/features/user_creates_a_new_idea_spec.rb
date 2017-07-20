require 'rails_helper'

describe "User creates a new idea" do
  scenario "a user can create a new idea" do
    # Category.create(name: "Grocery Store")
    category = create(:category)
    user = create(:user)
    idea = user.ideas.create(idea: "idea", category_id: category.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(idea.user)

    visit new_user_idea_path(user)

    fill_in "Idea", with: "Soylent"
    #don't know what this is called
    select category.name, from: "idea_category_id"
    click_on "Update Idea"

    visit user_path(user)

    expect(page).to have_content("Soylent")
  end
end
