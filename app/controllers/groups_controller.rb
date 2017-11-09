class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    if
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(group_params[:id])
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name,user_ids: [])
  end
end
