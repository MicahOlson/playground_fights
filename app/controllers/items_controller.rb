class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @items = Item.all
    render :index
  end

  def new
    @item = Item.new
    render :new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'Item was successfully created'
      redirect items_path
    else
      flash[:notice] = 'Item was not successfully created'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    render :show
  end

  def edit
    @item = Item.find(params[:id])
    render :edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update
      flash[:notice] = 'Item was successfully updated'
      redirect item_path
    else
      flash[:notice] = 'Item was not successfully updated'
      redirect :edit
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:notice] = 'Item was successfully deleted'
    redirect items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :health_bonus)
  end
end
