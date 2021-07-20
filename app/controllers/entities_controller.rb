class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def show
    @entity.find(params[:id])
  end

  def new
    @groups = Group.all.to_a
    @entity = Entity.new
  end

  def create
    @entity = current_user.entities.build(entity_params)

    if @entity.save
      redirect_to root_url, notice: 'Transaction was successfully created.'
    else
      render :new, alert: 'Transaction failed to create'
    end
  end

  def my_entities
    @my_entities = current_user.entities.where.not(group_id: nil)
    @total_amount = @my_entities.sum(:amount)
  end

  def my_external_entities
    @my_ext_entities = current_user.entities.where(group_id: nil)
    @total_ext_amount = @my_ext_entities.sum(:amount)
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
