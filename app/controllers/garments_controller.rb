class GarmentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @garment = current_user.garments.build(params[:garment])
    if @garment.save
      flash[:success] = "Garment created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @garment.destroy
    redirect_to root_path
  end

  private

    def correct_user
      @garment = current_user.garments.find_by_id(params[:id])
      redirect_to root_path if @garment.nil?
    end
end
