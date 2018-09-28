class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update, :destroy]

  def index
    # byebug
    # if params.try(:require, :power_id)
    #   @heroines = Heroine.all.find_by(power_id: search_params)
    # else
      @heroines = Heroine.all
    # end rescue nil
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
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
  end

  def destroy
  end

  private

  def heroine_params
    params.require(:heroine).permit(:super_name, :name).tap do |w|
      w[:power_id] = params[:power][:power_id]
    end
  end
  # 
  # def search_params
  #   params.require(:power_id)
  # end

  def find_heroine
    @heroine = Heroine.all.find_by(id: params[:id])
  end

end
