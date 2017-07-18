require 'rails_helper'

describe IdeaImage, type: :model do
  context "validations" do
    context "is invalid without valid attributes" do
      it "is invalid without an idea_id" do
        idea_image = IdeaImage.create(image_id: 1)

        expect(idea_image).to_not be_valid
      end

      it "is invalid without an image_id" do
        idea_image = IdeaImage.create(idea_id: 1)

        expect(idea_image).to_not be_valid
      end
    end
  end
  context "assocations" do
    it "responds to image" do
    Category.create(name: "Love")
    Idea.create(idea: "Be nice and loving", category_id: 1)
    Image.create(url: "www.ilovedaniela.com")
    idea_image = IdeaImage.create(idea_id: 1, image_id: 1)

    expect(idea_image).to respond_to(:image)
    end

    it "responds to idea" do
    Category.create(name: "Love")
    Idea.create(idea: "Be nice and loving", category_id: 1)
    Image.create(url: "www.ilovedaniela.com")
    idea_image = IdeaImage.create(idea_id: 1, image_id: 1)

    expect(idea_image).to respond_to(:idea)
    end
  end
end
