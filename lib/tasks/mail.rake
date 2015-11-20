
namespace :mail do
  desc "TODO"
  desc "Email items when it is 6 days old"
  task email_items: :environment do
    users = []
    Item.overdue.find_each do |item|
      users << item.user unless users.include? item.user
    end

    users.each do |user|
       items_array = user.items.overdue
      ItemMailer.remind_todo_item(user, items_array).deliver_now
    end
  end
end
