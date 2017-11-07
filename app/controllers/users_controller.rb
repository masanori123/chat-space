class UsersController < ApplicationController
  before_action ::set_user, only: [:edit, :update]


  def edit
  end

  def update
    if user.id == current_user.id
      user.update(users_params)
      redirect_to root_path
    else
      redirect_to controller: :users, action: :edit
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
