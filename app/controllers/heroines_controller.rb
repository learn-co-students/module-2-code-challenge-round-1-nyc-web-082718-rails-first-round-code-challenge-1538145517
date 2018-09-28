class HeroinesController < ApplicationController
  before_action :find_heroine, except: [:new, :create, :index]

  def index
    if params[:power]
      @heroines = Heroine.all.select{|h| h.power.name == "#{params[:power]}"}
    else
      @heroines = Heroine.all
    end
  end

  def show

  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(strong_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def edit

  end

  def update
    @heroine.update(strong_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to edit_heroine_path
    end
  end

  # def destroy
  #   @heroine.destroy
  #   redirect_to heroines_path
  # end

  private

  def find_heroine
    @heroine= Heroine.all.find_by(id: params[:id])
  end

  def strong_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
