require 'rails_helper'
describe Group do
  describe '#create' do
    it "is valid with a name " do
      group = build(:group)
      expect(group).to be_valid
    end
  end
end
