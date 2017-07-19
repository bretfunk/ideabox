require 'rails_helper'

describe Category, type: :model do
  context "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
      category = Category.create()

      expect(category).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with valid attributes" do
      category = Category.create(name: "Space")

      expect(category).to be_valid
      end
    end
  end
  context "assocations" do
    it "resonds to ideas" do
      category = create(:category, :with_ideas, idea_count: 3)

      expect(category).to respond_to(:ideas)
    end
  end
end
