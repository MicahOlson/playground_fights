class CharactersController < ApplicationController
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
    if @character.save
      flash[:notice] = 'Character was successfully created'
      redirect characters_path
    else
      flash[:notice] = 'Character was not successfully created'
      render :new
    end
  end

  def show
    @character = Character.find(params[:id])
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
      redirect character_path
    else
      flash[:notice] = 'Character was not successfully updated'
      redirect :edit
    end
  end

  def destroy
    Character.find(params[:id]).destroy
    flash[:notice] = 'Character was successfully deleted'
    redirect characters_path
  end

  private
  def character_params
    params.require(:character).permit(:name, :class, :health)
  end
end