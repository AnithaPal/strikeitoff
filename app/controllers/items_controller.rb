class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was created successfully"
    else
      flash[:error] = "Sorry, There was an error in creating your item. Please try again"
    end

    respond_to do |format|
      format.html
      format.js 
    end

  end

private
  def item_params
    params.require(:item).permit(:name)
  end

end
