class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update]


  def index
    @heroines = Heroine.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def edit
  end

  def update
    def create
      @heroine.update(heroine_params)
      if @heroine.save
        redirect_to @heroine
      else
        flash[:errors] = @heroine.errors.full_messages
        redirect_to edit_heroine_path
      end
    end
  end


  private

  def find_heroine
    @heroine = Heroine.find_by(id: params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
