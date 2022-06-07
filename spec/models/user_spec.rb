require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do
    it "Should create a new user if there is a password, and that it matches password_confirmation" do
      @user = User.new(first_name: "hongseoup", last_name: "yun", email: "test@test.com", password: "test", password_confirmation: "test")
      @user.save!
      expect(@user).to be_present
    end
    
    it "should return an error when password are not matching" do
      @user = User.new(first_name: "hongseoup", last_name: "yun", email: "test@test.com", password: "test1", password_confirmation: "test")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should return an error when password are missing" do
      @user = User.new(first_name: "hongseoup", last_name: "yun", email: "test@test.com")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "should return an error when password is shorter than 4 characters long" do
      @user = User.new(first_name: "hongseoup", last_name: "yun", email: "test@test.com",password: "1", password_confirmation: "1")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
  end

  describe ".authenticate_with_credentials" do
    before do
    @user_for_testing = User.create(first_name: "hongseoup", last_name: "yun", email: "test@test.com", password: "test", password_confirmation: "test")
    end

    describe "edge cases" do
      it "Should still authenticate if there are spaces before or after entered email" do
        user_to_test = User.authenticate_with_credentials(" test@test.com   ", "test")
      expect(user_to_test).to be_a(User)
      end

      it "Should still authenticate if visitor types email in wrong case" do
        user_to_test = User.authenticate_with_credentials("tEst@tEst.coM", "test")
      expect(user_to_test).to be_a(User)
      end
    end
  end   
end



# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required