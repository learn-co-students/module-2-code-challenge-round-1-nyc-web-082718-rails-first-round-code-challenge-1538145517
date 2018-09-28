class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = Heroine.all.order(:super_name)
    @power_options = Power.all.map { |power| [power.name, power.id] }
  end

  def show
  end

  def new
    @heroine = Heroine.new
    @power_options = Power.all.map { |power| [power.name, power.id] }
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def edit
    @power_options = Power.all.map { |power| [power.name, power.id] }
  end

  def update
    @heroine.update(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to edit_heroine_path
    end
  end

  def destroy
    @heroine.destroy
    redirect_to heroines_path
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end
end
