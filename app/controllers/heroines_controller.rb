class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = Heroine.all
  end

  def show
    @heroine_container = Power.all.find_by(id: @heroine.power_id)
  end

  def new
    @heroine = Heroine.new
    @power_list = Power.all.map{ |power| [power.name, power.id] }
  end

  def create
    @heroine = Heroine.create(heroine_params)
    redirect_to @heroine
  end

  def edit
  end

  def update
    @heroine = Heroine.update(heroine_params)
    redirect_to @heroine
  end

  def destroy
    @heroine.destroy
    redirect_to heroines_path
  end

  private

  def find_heroine
    @heroine = Heroine.all.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name)
  end
end
