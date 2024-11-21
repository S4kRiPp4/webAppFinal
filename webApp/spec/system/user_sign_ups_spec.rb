require 'rails_helper'
#update after user model
RSpec.describe "Users", type: :system do
 describe "User Registration" do
    # New user with correct information
   context "new user with correct information" do
     it "allows a user to sign up" do
       visit new_user_registration_path
       fill_in "Username", with: "CapybaraUser"
       fill_in "Email", with: "capybara@example.com"
       fill_in "Password", with: "password"
       fill_in "Password confirmation", with: "password"
       click_button "Sign up"
       expect(page).to have_content("Welcome! You have signed up successfully.")
     end
    end
 end
end

