require "rails_helper"

describe "User visits images index page" do
  context "as admin" do
    it "allows admin to see all images" do
	   admin = User.create(username: "penelope",
                        password: "boom",
                        role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path
      expect(page).to have_content("Admin Images")
    end
  end
  context "as default user" do
    it 'does not allow default user to see admin images index' do
      user = User.create(username: "fern@gully.com",
                         password: "password",
                         role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_images_path
      expect(page).to_not have_content("Admin Images")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
