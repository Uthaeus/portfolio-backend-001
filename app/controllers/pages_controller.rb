class PagesController < ApplicationController
  respond_to :json

  def home
    @message = "Welcome to the home page!"
    render json: @message
  end

  def about
  end

  def contact
  end

  def check_user
    render json: current_user
  end
end
