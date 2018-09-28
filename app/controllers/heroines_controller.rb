class HeroinesController < ApplicationController

  def index

    if params[:power_id]
      @heroines = Heroine.where(power_id: params[:power_id])

    else
      @heroines = Heroine.all
    end

  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)

    if @heroine.valid?

      render :show

    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  # def edit
  #   @heroine = Heroine.find_by(id: params[:id])
  # end
  #
  # def update
  #   @heroine = Heroine.find_by(id: params[:id])
  #
  #   if @heroine.valid?
  #
  #     render :show
  #
  #   else
  #     flash[:errors] = @heroine.errors.full_messages
  #     redirect_to edit_heroine_path
  #   end
  # end

  # def destroy
  #   @heroine = Heroine.find_by(id: params[:id])
  #   @heroine.destroy
  #   redirect_to heroines_path
  # end


  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
