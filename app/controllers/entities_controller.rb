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
    if params[:group] == 'true'
      @my_entities = current_user.entities.internal
      @group = true
    else
      @my_entities = current_user.entities.external
      @group = false
    end
    @my_entities = if params[:recent] == 'false'
                     @my_entities.most_ancient
                   else
                     @my_entities.most_recent
                   end
    @total_amount = @my_entities.sum(:amount)
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
