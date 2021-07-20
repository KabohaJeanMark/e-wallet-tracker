class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
