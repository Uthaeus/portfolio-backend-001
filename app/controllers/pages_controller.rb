class PagesController < ApplicationController
  respond_to :json

  def home
  end

  def about
  end

  def contact
  end

  def check_user
    render json: current_user
  end
end
