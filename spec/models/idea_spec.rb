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
        idea = create(:idea)

        expect(idea).to be_valid
      end
    end

    context "assocations" do
      it "should respond to category" do
        idea = create(:idea)

        expect(idea).to respond_to(:category)

      end

      it "should respond to image" do
        idea = create(:idea)

        expect(idea).to respond_to(:images)
      end
    end
  end
end
