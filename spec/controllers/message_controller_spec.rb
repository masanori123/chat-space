require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }

  describe 'GET #index' do
    let(:params) {{ group_id: group.id }}
    before do
      login_user user
      get :index, params: {group_id: group.id}
    end

    it "assigns the requested contact to @groups" do
      expect(assigns(:group)).to eq group
    end
  end
end
