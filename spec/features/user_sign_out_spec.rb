require 'rails_helper'

describe 'User sign out' do

  describe 'successful sign-out' do
    before do
      @user = create(:user)
      sign_in_user
    end

    it 'redirects user to #welcome' do
        find("#bs-header-navbar-collapse-1 > div > ul > a.btn.btn-warning.btn-sm").click
        expect( page ).to have_content "Signed out successfully"
        expect( current_path ).to eq(root_path)
    end
  end
end

def sign_in_user
  visit 'users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Sign in'
end
