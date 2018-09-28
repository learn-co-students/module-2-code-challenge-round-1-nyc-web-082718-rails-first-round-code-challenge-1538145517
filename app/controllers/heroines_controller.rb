class HeroinesController < ApplicationController
    before_action :find_heroine, only: [:show, :edit, :update, :destroy]

    def index
      @heroines = Heroine.all
    end

    def new
      @heroine = Heroine.new
      @power_options = Power.all.map do |power| [power.name, power.id]
      end
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

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
    end

    def find_heroine
      @heroine = Heroine.find_by(id: params[:id])
    end

end
