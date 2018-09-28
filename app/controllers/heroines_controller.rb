class HeroinesController < ApplicationController
  before_action :find_heroine, only: %i(show edit update destroy)

  def index
    @heroines = Heroine.search(params[:search])
    @powers = Power.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:error] = @heroine.errors.full_messages
      render new_heroine_path
    end
  end

  def edit
  end

  def update
    @heroine.update(heroine_params)
    redirect_to @heroine
  end

  def destroy
    @heroine.destroy
    redirect_to heroines_path
  end


  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end
end
