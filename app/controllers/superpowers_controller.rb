class SuperpowersController < ApplicationController
  before_action :get_power, only: [:show]

  def index
    @superpowers = Superpower.all
  end

  def show
  end

  private
    def get_power
      @superpower = Superpower.find(params[:id])
    end
end
