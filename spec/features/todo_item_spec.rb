require 'rails_helper'

describe "Todo items" do
   before do
      @user = create(:user)
      visit 'users/sign_in'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      visit(user_path(@user))
      # expect( page ).to have_content "My Page"
    end
  
  describe "Creating todo items" do
   
    it "allows user to create todo item" do
      fill_in 'item_name', with: "New task to do"
      click_button 'Add Todo Item'
      expect(page).to have_content "Item was created successfully"
    end
  end

  describe "Destroying todo item" do
    it "shows flash message that item was deleted" do
      item_1 = create(:item, user: @user)
      item_2 = create(:item, user: @user)
      visit(user_path(@user))
      # click_link "#item-#{item_1.id}"
      save_and_open_page
      find(:xpath, "/a[@href=\"users/#{ @user.id }/items/#{ item_1.id }\"]").click
      # click_link find "#item-#{item_1.id}-link"

      expect(page).to have_content "Item was created successfully"
    end
  end


end
