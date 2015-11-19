class ItemMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.new_item.subject
  #
  def new_item(item)
    @item = item
    @user  = @item.user

    mail to: "@user.email",
         subject: "New Todo Item is created"
  end


  def remind_todo_item(user, items_array)
    @user = user
    @items = items_array

    mail to: "@user.email",
         subject: "Reminder to do finish your to do items"
  end
end
