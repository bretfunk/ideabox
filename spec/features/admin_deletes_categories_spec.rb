require 'rails_helper'

describe "Admin can delete categories" do
  it "can delete categories from the categories page" do
   admin = create(:user, role: 1)
   category = create(:category)
   category2 = create(:category)


   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

   visit admin_categories_path

   expect(page).to have_content(category.name)

   expect(page).to have_content(category2.name)

   first(:link, "Delete").click

   visit admin_categories_path


   expect(page).to_not have_content(category.name)
   expect(page).to have_content(category2.name)
  end
end
