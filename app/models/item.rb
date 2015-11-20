class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  scope :overdue, -> {where(['created_at <= ?', (Date.today - 6.days)])}

  def days_left
    7 - (DateTime.now.to_date - created_at.to_date).to_i
  end
end
