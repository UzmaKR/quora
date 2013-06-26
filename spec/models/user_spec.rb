require 'spec_helper'

describe User do
  
  let(:user) { create(:user) }

  describe "user attributes" do 
    it "should respond to name" do
      expect(user).to respond_to(:username)
    end

    it "should respond to password" do
      expect(user).to respond_to(:password)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
  end

  describe "user validations" do
    it "should not allow a user to sign up without an email" do
      user_without_email =  build(:user, :email => "")
      expect(user_without_email).to_not be_valid
    end
  end
end
