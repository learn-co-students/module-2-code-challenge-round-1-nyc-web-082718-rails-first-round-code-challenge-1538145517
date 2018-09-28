class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def new
    @heroine = Heroine.new


    @power_list = Power.all.map {|power| [power.name, power.id] }
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def edit
    @heroine = heroine.find_by(id: params[:id])
  end

  def update
    @heroine = heroine.find_by(id: params[:id])
    @heroine.update(heroine_params)
    redirect_to edit_heroine_path
  end

  def destroy
    @heroine = Heroine.find_by(id: params[:id])
    @heroine.destroy
    redirect_to heroines_path
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
