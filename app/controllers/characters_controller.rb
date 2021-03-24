class CharactersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @characters = Character.all
    render :index
  end

  def new
    @character = Character.new
    render :new
  end

  def create
    @character = Character.new(character_params)
    @character[:user_id] = current_user.id
    if @character.save
      flash[:notice] = 'Character was successfully created'
      redirect_to characters_path
    else
      flash[:notice] = 'Character was not successfully created'
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
    @items = Item.all
    render :show
  end

  def edit
    @character = Character.find(params[:id])
    render :edit
  end

  def update
    @character = Character.find(params[:id])
    if @character.update
      flash[:notice] = 'Character was successfully updated'
      redirect_to character_path
    else
      flash[:notice] = 'Character was not successfully updated'
      redirect_to :edit
    end
  end

  def destroy
    Character.find(params[:id]).destroy
    flash[:notice] = 'Character was successfully deleted'
    redirect_to characters_path
  end

  private
  def character_params
    params.require(:character).permit(:name, :role, :health)
  end
end
