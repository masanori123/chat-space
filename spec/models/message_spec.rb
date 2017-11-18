require 'rails_helper'
describe Message do

  describe '#create' do
    context 'is valid' do
      it "is valid with a body " do
      message = build(:message, image: nil)
      expect(message).to be_valid
      end

      it "is valid with a image " do
      message = build(:message, body: nil)
      expect(message).to be_valid
      end

      it "is valid with a body && a image " do
      message = build(:message)
      expect(message).to be_valid
      end
    end

    context 'is invalid' do
      it "is invalid without a group && an image" do
      message = build(:message, body: nil, image: nil)
      message.valid?
      expect(message.errors[:body]).to include("エラーです")
      end

      it "is invalid without a group" do
      message = build(:message, group: nil)
      message.valid?
      expect(message.errors[:group]).to include("を入力してください")
      end

      it "is invalid without an user" do
      message = build(:message, user: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end
