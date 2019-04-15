require 'rails_helper'

describe "A user who visits the app" do
  describe "when they navigate anywhere on the site" do
    # --------------------------------------------------------------------------------
    it 'displays the site logo in the top left corner of the page' do
      visit '/'

      within ".nav" do
        expect(page).to have_css("img[class='logo-image']")
      end
    end
    # --------------------------------------------------------------------------------
    it 'redirects user to home page when logo is clicked' do
      visit '/'
      click_on 'Home'
      expect(current_path).to eq(root_path)
    end
    # --------------------------------------------------------------------------------
    # it 'displays Login and Signup links if logged out' do
    #   @user_1 = User.create(username: '420master69', password: "securepassword123")
      
    #   visit '/'
      
    #   expect(page).to_not have_link("Logout")
    #   expect(page).to_not have_link("History")
    #   expect(page).to have_link("Login")
    #   expect(page).to have_link("Sign Up")
      
    #   stub_login(@user_1)

    #   visit '/'
      
    #   expect(page).to have_link("Logout")
    #   expect(page).to have_link("History")
    #   expect(page).to_not have_link("Login")
    #   expect(page).to_not have_link("Sign Up")

    # end
  end
end
