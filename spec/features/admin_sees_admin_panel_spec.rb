require 'rails_helper'

describe "admin panel on user page" do
  it "should be visable to an admin when logged in" do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit user_path(admin)

    expect(page).to have_content("Welcome Admin!")
    expect(page).to have_content("Link to categories:")
    expect(page).to have_content("Link to images:")

  end

  it "should not be visable to lame non-admins when logged in" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to_not have_content("Welcome Admin!")
    expect(page).to_not have_content("Link to categories:")
    expect(page).to_not have_content("Link to images:")

  end
end
