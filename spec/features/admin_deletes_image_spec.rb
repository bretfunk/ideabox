require 'rails_helper'

describe "Admin deletes image when logged in" do
  it "a admin deletes an image" do
    admin = create(:user, role: 1)
    image1 = create(:image)
    image2 = create(:image)

   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

   visit admin_categories_path

  #  expect(page).to have_content(image1.name)
  #  expect(page).to have_content(image2.name)

 #  first(:link, "Delete").click

   visit admin_categories_path


  #  expect(page).to_not have_content(image1.name)
  #  expect(page).to have_content(image2.name)
  end

end
