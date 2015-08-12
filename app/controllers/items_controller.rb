class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was created successfully"
    else
      flash[:error] = "Sorry, There was an error in creating your item. Please try again"
<<<<<<< HEAD
=======
    end

    respond_to do |format|
      format.html
      format.js 
    end
  end

  def destroy
    @user = current_user
    @item = current_user.items.find(params[:id])
    if @item.destroy!
      flash[:notice] = "Yey, you have completed this task ---> #{@item.name}!"
    else
      flash[:error] = "Sorry, There was an error in destroying your item. Please try again"
    end

    respond_to do |format|
      format.html
      format.js
>>>>>>> mark-as-completed
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
