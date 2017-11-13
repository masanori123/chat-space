class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    binding.pry
    if @message.save
      redirect_to controller: :messages, action: :index
    else
      redirect_to group_messages_path(params[:group_id])
    end
  end

  def message_params
    params.require(:message).permit(:body, :image, :created_at).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end

