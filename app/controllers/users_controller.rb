class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.user_id == current_user.id
      user.update(update_params)
    end
  end

  private

  def users_params
    params.permit(:name, :email )
  end
end
