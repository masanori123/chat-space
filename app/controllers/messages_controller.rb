class MessagesController < ApplicationController
  before_action :set_group, only:[:index, :create]
  before_action :set_messages, only:[:index, :create]

  def index
    @user = current_user
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to group_messages_path(params[:group_id]) }
        format.json
      else
        flash.now[:alert] = "メッセージを入力してください"
        format.html { render :index }
      end
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image, :created_at).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end

end
