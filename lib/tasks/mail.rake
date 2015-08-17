namespace :mail do
  desc "TODO"
  desc "Email items when it is 6 days old"
  task email_items: :environment do
    Item.where((DateTime.now.to_date - created_at.to_date).to_i == 6).find_each do |item|
      ItemMailer.new_item(item).deliver_now
    end
  end
end

