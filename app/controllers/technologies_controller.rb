class TechnologiesController < ApplicationController
  before_action :set_technology, only: %i[ show update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  respond_to :json

  # GET /technologies
  def index
    @technologies = Technology.all

    render json: @technologies
  end

  # GET /technologies/1
  def show
    render json: @technology
  end

  # POST /technologies
  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      render json: @technology, status: :created, location: @technology
    else
      render json: @technology.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /technologies/1
  def update
    if @technology.update(technology_params)
      render json: @technology
    else
      render json: @technology.errors, status: :unprocessable_entity
    end
  end

  # DELETE /technologies/1
  def destroy
    @technology.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology
      @technology = Technology.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technology_params
      params.require(:technology).permit(:name, :portfolio_item_id, :percent_utilized, :image)
    end
end
