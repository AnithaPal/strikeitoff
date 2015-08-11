require 'rails_helper'

RSpec.describe Item, :type => :model do
  it "is valid with a name" do
    expect(build(:item)).to be_valid
  end

  it "is invalid witout a name" do
    item = build(:item, name: nil)
    item.valid?
    expect(item.errors[:name]. to include("can't be blank"))
  end
end
