class SupermarketsController < ApplicationController

  def index
    @supermarket = Supermarket.all

  end

  def show
      @supermarket = Supermarket.find(params[:id])
  end

end
