require 'rails-helper'

describe "Admin edits a category title" do
  it "an admin edits a category title" do
    admin = create(:admin, role: 1)
    category = create(:category)


    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    expect(page).to have_content(category.name)

    click_on "Edit"

    fill_in "Name", with: "Fake Category"

    click_on "Update Category"

    visit admin_categories_path

    expect(page).to have_content("Fake Category")
  end
end
