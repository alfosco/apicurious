require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

    before(:all) do
      @user = User.new(uid: "1234567", username: "alfosco")
    end

    it "responds to uid" do
      expect(@user).to respond_to(:uid)
    end

    it "responds to username" do
      expect(@user).to respond_to(:username)
    end
  end
end
