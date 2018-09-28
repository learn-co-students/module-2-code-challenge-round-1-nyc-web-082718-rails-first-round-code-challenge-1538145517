class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

    def show
      @power = Power.find_by(id: params[:id])
    end

    def new
      @power = Power.new
    end

    def create
      @power = Power.create(power_params)
      redirect_to new_power_path
    end

    def edit
      @power = power.find_by(id: params[:id])
    end

    def update
      @power = power.find_by(id: params[:id])
      @power.update(power_params)
      redirect_to edit_power_path
    end

    def destroy
      @power = Power.find_by(id: params[:id])
      @power.destroy
      redirect_to powers_path
    end

    private

    def power_params
      params.require(:power).permit(:name, :description)
    end
end
