class PowersController < ApplicationController
  before_action :find_power, except: [:new, :create, :index]

  def index
    @powers = Power.all
  end

  def show

  end

  # def new
  #   @power = Power.new
  # end
  #
  # def create
  #   @power = Power.create(strong_params)
  #   if @power.valid?
  #     redirect_to @power
  #   else
  #     flash[:errors] = @power.errors.full_messages
  #     redirect_to new_power_path
  #   end
  # end
  #
  # def edit
  #
  # end
  #
  # def update
  #   @power.update(strong_params)
  #   if @power.valid?
  #     redirect_to @power
  #   else
  #     flash[:errors] = @power.errors.full_messages
  #     redirect_to edit_power_path
  #   end
  # end
  #
  # def destroy
  #   @power.destroy
  #   redirect_to powers_path
  # end

  private

  def find_power
    @power= Power.all.find_by(id: params[:id])
  end

  def strong_params
    params.require(:power).permit(:name, :super_name, :power_id)
  end
end
