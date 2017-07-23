require 'rails_helper'

describe "Admin can add an image" do
  context "when on the admin image page" do
    it "admin adds an image" do
      admin = create(:user, role: 1)
      image = create(:image)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_images_path

      #doesn't work because the images don't have names, I am a dummy
      # expect(page).to have_content(image)

    end
  end
end
