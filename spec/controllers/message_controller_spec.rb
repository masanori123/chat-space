require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:groups) { user.groups }
  let(:message) { create(:message)}
  let(:messages) { crate(:messages)}
  let(:group_id) do
    { prams: { gtoup_id: group.id, message: attributes_for(:message)}}
  end

  describe 'GET #index' do
    let(:params) {{ group_id: group.id }}
    before do
      login_user user
      get :index, params: {group_id: group.id}
    end

    it "assigns the requested contact to @groups" do
      expect(assigns(:group)).to eq group
    end

    it 'assigns the requested messsage to @message' do
      expect(assigns(:message)).to be_a_new(Message)
    end

    it 'assigns the requested messsage to @groups' do
      expect(assigns(:groups)).to eq groups
    end

    it 'assigns the requested messsages to @messages' do
      expect(assigns(:messages)).to eq messages
    end
  end
end
