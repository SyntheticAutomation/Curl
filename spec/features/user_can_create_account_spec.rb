require 'rails_helper'

describe 'A user who visits the app' do
  # ----------------------------------------------------------------
  it 'can create an account' do
    visit '/'
    click_on "Sign Up"

    fill_in :user_username, with: 'gandalf'
    fill_in :user_password, with: "password123"
    fill_in :user_confirm_password, with: "password123"

    click_on 'Create Account'

    expect(current_path).to eq('/')
    expect(page).to have_content("Registration successful!")

    within '.nav-left' do
      expect(page).to have_content('Logged in as gandalf')
    end
  end
  # ----------------------------------------------------------------
  it 'will prevent registration if password is less than 8 characters' do
    visit '/'
    click_on "Sign Up"

    fill_in :user_username, with: 'gandalf'
    fill_in :user_password, with: "pw"
    fill_in :user_confirm_password, with: "pw"

    click_on 'Create Account'
    expect(page).to have_content('Error: password must be more than 7 characters')
  end
  # ----------------------------------------------------------------
  it 'will prevent registration if password and password confirmation dont match' do
    visit '/'
    click_on "Sign Up"

    fill_in :user_username, with: 'gandalf'
    fill_in :user_password, with: "password123"
    fill_in :user_confirm_password, with: "fewnaiouvbhugyftghvjbeuip"

    click_on 'Create Account'
    expect(page).to have_content('Error: password fields do not match')
  end
  # ----------------------------------------------------------------
  it 'will prevent registration if username already exists' do
    user_1 = User.create(username: 'gandalf', password: 'allwehavetodecide')

    visit '/'
    click_on "Sign Up"

    fill_in :user_username, with: 'gandalf'
    fill_in :user_password, with: "password123"
    fill_in :user_confirm_password, with: "password123"

    click_on 'Create Account'

    expect(page).to have_content("Error: username already exists")
  end
end