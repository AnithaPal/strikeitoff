require "rails_helper"

RSpec.describe ItemMailer, :type => :mailer do
  describe "new_item" do
    let(:mail) { ItemMailer.new_item }

    it "renders the headers" do
      expect(mail.subject).to eq("New Todo Item is created")
      expect(mail.to).to eq(["codetrain15@gmail.com"])
      expect(mail.from).to eq(["admin@strikeitoff.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("A new todo item is created for you to finish:")
    end
  end

end
