class ItemsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @item = current_user.items.build(params[:item])
    if @item.save
      flash[:success] = "Item created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

    def correct_user
      @item = current_user.items.find_by_id(params[:id])
      redirect_to root_path if @item.nil?
    end
end
