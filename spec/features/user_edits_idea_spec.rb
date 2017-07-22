require 'rails_helper'

describe "User edits an idea" do
  scenario "a user edits an idea" do
    idea = create(:idea)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(idea.user)

    visit user_path(idea.user)

    click_on "Edit"

    fill_in "Idea", with: "Apples"

    click_on "Update Idea"

    visit user_path(idea.user)

    expect(page).to have_content("Apples")

  end
end
