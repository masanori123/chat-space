class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    @message = Message.new
    if @message.save(message_params)
      redirect_to controller: :messages, action: :index
    else
      redirect_to group_message_path(params[:group_id])
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image, :created_at).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end

