require 'rails_helper'

describe "User creates a new idea" do
  scenario "a user can create a new idea" do
    user = create(:user)
    category = create(:category)

    idea1 = user.ideas.create(idea: "Apples", category_id: category.id)
    idea2 = user.ideas.create(idea: "Bananas", category_id: category.id)
    idea3 = user.ideas.create(idea: "Grapes", category_id: category.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_ideas_path(user)

    expect(page).to have_content(idea1.idea)
    expect(page).to have_content(idea2.idea)
    expect(page).to have_content(idea3.idea)

  end
end
