class PowersController < ApplicationController
  before_action :find_power, only: [:show]

  # Would also add :edit, :update, :destroy ^^^

  def index
    @powers = Power.all
  end

  def show
    @powers = Power.all.find_by(id: params[:id])
  end

  # def new
  #   @power = Power.new
  # end
  #
  # def create
  #   @power = Power.create(power_params)
  #   redirect_to @power
  # end
  #
  # def edit
  #
  # end
  #
  # def update
  #   @power.update(power_params)
  #   redirect_to @power
  # end
  #
  # def destroy
  #   @power.destroy
  #   redirect_to powers_path
  # end

  private

  def find_power
    @power = Power.find_by(id: params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :super_name, :power_id, :heroine)
  end
end
