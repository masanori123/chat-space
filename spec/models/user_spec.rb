require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a name " do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is valid with a email " do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is valid with a password " do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is valid with a password_confirmation " do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
