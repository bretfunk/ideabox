require 'rails_helper'

describe Image, type: :model do
  context "validations" do
    context "invalid attributes" do
      it "is invalid without an URL" do
        image = Image.create()

        expect(image).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid" do
        image = Image.create(url: "www.spacex.com")

        expect(image).to be_valid
      end
    end
  end
  context "assocations" do
    it "associates with ideas" do
      category = Category.create(name: "Space")
      idea = category.ideas.create(idea: "Mine the moon")
      image = Image.create(url: "www.spacex.com")
      idea_image = IdeaImage.create(idea_id: 1, image_id: 1)

      expect(image).to respond_to(:ideas)
    end
  end
end
