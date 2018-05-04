class SuperheroesController < ApplicationController
  before_action :get_hero, only: [:show]
  
  def index
    @superheroes = Superhero.all
  end

  def show
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end
  
  def create
    @superhero = Superhero.create(superhero_params)
    if @superhero.valid?
      redirect_to @superhero
    else
      flash[:errors] = @superhero.errors.full_messages
      
      redirect_to new_superhero_path
    end
  end

  private
    def get_hero
      @superhero = Superhero.find(params[:id])
    end

    def superhero_params
      params.require(:superhero).permit(:name, :super_name, :superpower_id)
    end
end
