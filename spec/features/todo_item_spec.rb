require 'rails_helper'

describe "Todo items" do
   before do
      @user = create(:user)
      visit 'users/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      visit(user_path(@user))
    end
  
  describe "Creating todo items" do
   
    it "allows user to create todo item" do
      expect(page).to have_content "My Page"
      find("#item_name").fill_in "New task", with: "New task to do"
      # page.find_field("item_name").fill_in "New task", with: "New Task"
      # fill_in "New_task", with: "New Task"
    end
  end
end

  
