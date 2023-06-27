class PortfolioCommentsController < ApplicationController
  before_action :set_portfolio_comment, only: %i[ show update destroy ]

  # GET /portfolio_comments
  def index
    @portfolio_comments = PortfolioComment.all

    render json: @portfolio_comments
  end

  # GET /portfolio_comments/1
  def show
    render json: @portfolio_comment
  end

  # POST /portfolio_comments
  def create
    @portfolio_comment = PortfolioComment.new(portfolio_comment_params)

    if @portfolio_comment.save
      render json: @portfolio_comment, status: :created, location: @portfolio_comment
    else
      render json: @portfolio_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /portfolio_comments/1
  def update
    if @portfolio_comment.update(portfolio_comment_params)
      render json: @portfolio_comment
    else
      render json: @portfolio_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /portfolio_comments/1
  def destroy
    @portfolio_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_comment
      @portfolio_comment = PortfolioComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def portfolio_comment_params
      params.require(:portfolio_comment).permit(:content, :portfolio_item_id, :user_id)
    end
end
