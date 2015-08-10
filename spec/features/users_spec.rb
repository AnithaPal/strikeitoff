require 'spec_helper'
require 'rails_helper'

feature 'User management' do
  scenario 'New user sign up' do
    user = create(:user)
    visit root_path
    find('//*[@id="bs-header-navbar-collapse-1"]/div/ul/a[2]').click_link 'Sign up'
    fill_in 'Name'
    fil_in 'Email'
    fill_in 'Password'
    fill_in 'Password_confirmation'
    find('//*[@id="new_user"]/div[6]/input').click_button 'Sign up'
   

    expect(page).to have_content 'sign in or sign up '

  end

  scenario 'User sign in' do
    visit  root_path
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'My page'
  end

end


