class GroupsController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    if @user.id == current_user.id
      @user.update(users_params)
      redirect_to root_path
    else
      render :edit
  end
end
