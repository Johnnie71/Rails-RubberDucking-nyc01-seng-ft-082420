class DucksController < ApplicationController

  before_action :find_duck, only: [:show, :create, :edit, :update]

  def index
    @ducks = Duck.all
  end

  def show
    
  end

  def edit
    
  end


  private

  def duck_params
    params.require(:duck).permit!
  end

  def find_duck
    @duck = Duck.find(params[:id])
  end

end
