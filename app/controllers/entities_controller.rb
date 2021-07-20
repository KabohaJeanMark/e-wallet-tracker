class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def show
    @entity.find(params[:id])
  end

  def new
    @group_options = [['none', nil]]
    @group_options += Group.all.map { |g| [g.name, g.id] }
    @entity = Entity.new
  end

  def create
    @entity = current_user.entities.build(entity_params)
    if @entity.save
      redirect_to root_url
    else
      render :new
    end
  end

  def my_entities
    @my_entities = current_user.entities.where.not(group_id: nil)
  end

  def my_external_entities
    @my_ext_entities = current_user.entities.where(group_id: nil)
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
