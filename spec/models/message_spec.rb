require 'rails_helper'
describe Message do

  describe '#create' do
    # it "is invalid without a body" do
    #   message = build(:message, body: nil, image: nil)
    #   message.valid?
    #   binding.pry
    #   expect(message.errors[:body]).to include("can't be blank")
    # end
    it "is valid with a body " do
      message = build(:message, image: nil)
      expect(message).to be_valid
    end
  end
end
