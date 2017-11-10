class MessagesController < ApplicationController

  def index
    @groups = Group.all
    @groups = current_user.groups
  end

end
