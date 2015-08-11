require 'rails_helper'

describe 'User sign in' do

  describe 'successful sign-in' do
    before do
      @user = create(:user) 
    end

    it 'redirects user to user#show' do
      sign_in_nav
      fill_in 'Email', with: 'codetrain15+1@gmail.com'
      fill_in 'Password', with: 'helloworld'
      click_button 'Sign in'
      expect( page ).to have_content "Signed in successfully"
      expect( current_path ).to eq(root_path)
    end
  end

  describe 'unsuccessful sign-in' do
    before do
      @user = create(:user) 
    end

    it 'requires confirmed user' do
      @user.update_attributes(confirmed_at: nil)

      sign_in_nav
      fill_in 'Email', with: 'codetrain15+6@gmail.com'
      fill_in 'Password', with: 'helloworld'
      click_button 'Sign in'
      expect( page ).to have_content "You have to confirm your email address before continuing"
    end

    it 'requires correct password for user' do
      sign_in_nav
      fill_in 'Email', with: 'codetrain15+1@gmail.com'
      fill_in 'Password', with: 'incorrectpass'
      click_button 'Sign in'
      expect( page ).to have_content "Invalid email or password"
    end

    it 'require correct email for user' do
      sign_in_nav
      fill_in 'Email', with: 'code@gmail.com'
      fill_in 'Password', with: 'helloworld'
      click_button 'Sign in'
      expect( page ).to have_content "Invalid email or password"
    end
  end
end

def sign_in_nav
  visit 'users/sign_in'
end