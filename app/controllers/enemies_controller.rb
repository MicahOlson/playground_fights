class EnemiesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @enemies = Enemy.all
    render :index
  end

  def new
    @enemy = Enemy.new
    render :new
  end

  def create
    @enemy = Enemy.new(enemy_params)
    if @enemy.save
      flash[:notice] = 'Enemy was successfully created'
      redirect enemies_path
    else
      flash[:notice] = 'Enemy was not successfully created'
      render :new
    end
  end

  def show
    @enemy = Enemy.find(params[:id])
    render :show
  end

  def edit
    @enemy = Enemy.find(params[:id])
    render :edit
  end

  def update
    @enemy = Enemy.find(params[:id])
    if @enemy.update
      flash[:notice] = 'Enemy was successfully updated'
      redirect enemy_path
    else
      flash[:notice] = 'Enemy was not successfully updated'
      redirect :edit
    end
  end

  def destroy
    Enemy.find(params[:id]).destroy
    flash[:notice] = 'Enemy was successfully deleted'
    redirect enemies_path
  end

  private
  def enemy_params
    params.require(:enemy).permit(:name, :bully, :health)
  end
end
