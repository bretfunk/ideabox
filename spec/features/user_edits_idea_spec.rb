require 'rails_helper'

describe "User edits an idea" do
  scenario "a user edits an idea" do
    idea = create(:idea)

    visit idea_path(idea)

    click_on "Edit"

    #need actual title below
    fill_in "Apples"

    click_on "Submit"

    visit idea_path(idea)

    expect(page).to have_content("Apples")

  end
end
