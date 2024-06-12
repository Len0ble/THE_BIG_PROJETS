class PagesController < ApplicationController
  
  def Accueil
    @potins = Potin.all
  end

  def equipes
    # logique pour l'action equipes
  end

  def contact
  end

  def bienvenue
    @potins = Potin.all
  end

  def show
    @potin = Potin.find(params[:id])
  end

  def showAll
    @potins = Potin.all
  end
  
  def new
    @potin = Potin.new
  end

  def create
    @potin = Potin.new(potin_params)
    @potin.user = User.find_by(id: session[:user_id])
    if @potin.save
      redirect_to potin_path(@potin), notice: 'Potin was successfully created.'
    else
      render :new
    end
  end

  def edit
    @potin = Potin.find(params[:id])
  end

  def update
    @potin = Potin.find(params[:id])
    if @potin.update(potin_params)
      redirect_to pages_showAll_path, notice: 'Potin mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @potin = Potin.find(params[:id])
    if @potin.destroy
      redirect_to pages_showAll_path, notice: 'Potin was successfully deleted.'
    else
      redirect_to pages_showAll_path, alert: 'Unable to delete Potin.'
    end
  end

  private

  def potin_params
    params.require(:potin).permit(:author, :content)
  end
end
