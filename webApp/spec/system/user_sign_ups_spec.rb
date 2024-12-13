require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe "User Registration" do
    # Happy Path: New user with correct information
    context "new user with correct information" do
      it "allows a user to sign up and redirects to the homepage" do
        visit new_user_registration_path
        fill_in "Email", with: "capybara@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"

        # Check for homepage content
        expect(page).to have_content("Welcome to PokéPlaza!")
        expect(page).to have_link("Logout")
        expect(page).not_to have_link("Sign Up")
      end
    end

    # Sad Path: New user with mismatched passwords
    context "new user with invalid information" do
      it "does not allow a user to sign up with mismatched passwords" do
        visit new_user_registration_path
        fill_in "Email", with: "capybara@example.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "wrongpassword"
        click_button "Sign up"

        # Verify error message
        expect(page).to have_content("Password confirmation doesn't match Password")
      end
    end
  end
end
