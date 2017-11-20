require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:groups) { user.groups }
  let(:message) { create(:message)}
  let(:messages) { group.messages}
  let(:group_id) do
    { prams: { gtoup_id: group.id, message: attributes_for(:message)}}
  end
  let(:params) do
    { params: { group_id: group.id, message: attributes_for(:message) } }
  end

  describe 'GET #index' do
    let(:params) {{ group_id: group.id }}
    before do
      login_user user
      get :index, params: {group_id: group.id}
    end

    context 'login' do

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

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    context 'not login' do

      it 'redirects to new_user_session_path' do
        redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    context 'user loged-in and successfully saved' do
      before do
        login_user user
      end

      it 'saves the new message in the database' do
        expect{post :create, params}.to change(Message, :count).by(1)
      end

      it 'redirects to messages#index' do
        post :create, params
        expect(response).to redirect_to group_messages_path
      end
    end
  end
end
