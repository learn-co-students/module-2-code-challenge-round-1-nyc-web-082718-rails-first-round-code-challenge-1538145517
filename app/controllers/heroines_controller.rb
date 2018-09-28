class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update, :destroy]

  def index
    if params[:power]
      @heroines = Heroine.all.select do |heroine|
        heroine.power.name == params[:power]
      end

        if @heroines
          @heroines
        else
          flash[:notice] = "No Matching Results"
          @heroines = Heroine.all
        end
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
    @heroine = Heroine.new(heroine_params)

    if @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path(@heroine)
    end
  end

  def edit
  end

  def update
    @heroine.update(heroine_params)

    if @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to edit_heroine_path(@heroine)
    end
  end

  def destroy
    @heroine.destroy
    redirect_to heroines_path
  end

  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:super_name, :name, :power_id, :power)
  end

end
