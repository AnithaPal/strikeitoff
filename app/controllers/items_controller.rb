class ItemsController < ApplicationController

  def new
    @user = user.find[params[:user_id]]
    @item = Item.new
  end  

  def create
    @user = current_user
    @item = @user.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was created successfully"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Sorry, There was an error in creating your item. Please try again"
      redirect_to user_path(current_user)
    end
  end

private
  def item_params
    params.require(:item).permit(:name)
  end

end
