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
        image = create(:image)

        expect(image).to be_valid
      end
    end
  end
  context "assocations" do
    it "associates with ideas" do
      image = create(:image)

      expect(image).to respond_to(:ideas)
    end
  end
end
