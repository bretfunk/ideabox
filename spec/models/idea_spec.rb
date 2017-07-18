require 'rails_helper'

describe Idea, type: :model do
  context "validations" do
    context "invalid attributes" do
      it "is invalid without an idea" do
        category = Category.create(name: "Space")
        idea = category.ideas.new

        expect(idea).to_not be_valid
      end
    end
    context "valid with valid data" do
      it "is valid with valid data" do

        category = Category.create(name: "Space")
        idea = category.ideas.create(idea: "Mine the moon")

        expect(idea).to be_valid
      end
    end

    context "assocations" do
      it "should respond to category" do
        category = Category.create(name: "Space")
        idea = category.ideas.create(idea: "Mine the moon")

        expect(idea).to respond_to(:category)

      end

      it "should respond to image" do
        category = Category.create(name: "Space")
        idea = category.ideas.create(idea: "Mine the moon")
        image = Image.create(url: "www.spacex.com")
        idea_image = IdeaImage.create(idea_id: 1, image_id: 1)

        expect(idea).to respond_to(:images)
      end
    end
  end
end
