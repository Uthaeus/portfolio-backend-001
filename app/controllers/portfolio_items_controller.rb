class PortfolioItemsController < ApplicationController
  before_action :set_portfolio_item, only: %i[ show update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  respond_to :json

  # GET /portfolio_items
  def index
    @portfolio_items = PortfolioItem.all

    render json: @portfolio_items
  end

  # GET /portfolio_items/1
  def show
    render json: @portfolio_item, include: :portfolio_comments
  end

  # POST /portfolio_items
  def create
    @portfolio_item = PortfolioItem.new(portfolio_item_params)

    if @portfolio_item.save
      render json: @portfolio_item, status: :created, location: @portfolio_item
    else
      render json: @portfolio_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /portfolio_items/1
  def update
    if @portfolio_item.update(portfolio_item_params)
      render json: @portfolio_item
    else
      render json: @portfolio_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /portfolio_items/1
  def destroy
    @portfolio_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_item
      @portfolio_item = PortfolioItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_item_params
      params.require(:portfolio_item).permit(:title, :description, :image, :url, :technologies)
    end
end
