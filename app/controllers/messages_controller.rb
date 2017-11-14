class MessagesController < ApplicationController
  before_action :set_group, only:[:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to controller: :messages, action: :index
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
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

end

