class HeroinesController < ApplicationController

  before_action :find_heroine, only: [:show, :create, :edit, :destroy]

  def index
    @heroines = Heroine.all
    # if params['power_name'] == nil
    #   @heroines = Heroine.all
    # else
    #   @heroines = Heroine.all
    #   @heroines.find_all {|heroine| heroine.power_id == params['power_name']}
    # end
  end

  def show
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all.map {|power| [power.name, power.id]}
  end

  def create
      @heroine = Heroine.create(heroine_params)
      if @heroine.valid?
        redirect_to heroine_path(@heroine)
      else
        flash[:error] = @heroine.errors.full_messages
        redirect_to new_heroine_path
      end
  end

  def search

  end



  private

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end







end
