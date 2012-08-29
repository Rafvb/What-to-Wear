class ItemsController < ApplicationController
  before_filter :signed_in_user, only: [:show, :new, :create, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:show, :edit, :update, :destroy]

  def index
    @items = current_user.items.paginate(page: params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(params[:item])
    if @item.save
      flash[:success] = "Item created!"
      redirect_to items_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update_attributes(params[:item])
      flash[:success] = "Item updated"
      redirect_to @item
    else
      render 'edit'
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
