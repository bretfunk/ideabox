require 'rails_helper'

describe User do
  it "can be created as an admin" do
    user = User.create(username: "penelope",
                       password: "boom",
                       role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as a default user" do
    user = User.create(username: "sammy",
                       password: "pass",
                       role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
  context "validations" do
    context "is invalid with invalid attributes"
    it "is invalid without a username" do

      user = User.create(password: "pass")

      expect(user).to be_invalid
    end

    it "is invalid wtihout a password" do
      user = User.create(username: "Elon")

      expect(user).to be_invalid
    end
  end
  context "is valid with valid attributes" do
    it "is valid" do
      user = create(:user)

      expect(user).to be_valid
    end
  end
end
