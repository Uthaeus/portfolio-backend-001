class BlogCommentsController < ApplicationController
  before_action :set_blog_comment, only: %i[ show update destroy ]
  respond_to :json

  # GET /blog_comments
  def index
    @blog_comments = BlogComment.all

    render json: @blog_comments
  end

  # GET /blog_comments/1
  def show
    render json: @blog_comment
  end

  # POST /blog_comments
  def create
    @blog_comment = BlogComment.new(blog_comment_params)

    if @blog_comment.save
      render json: @blog_comment, status: :created, location: @blog_comment
    else
      render json: @blog_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blog_comments/1
  def update
    if @blog_comment.update(blog_comment_params)
      render json: @blog_comment
    else
      render json: @blog_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blog_comments/1
  def destroy
    @blog_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_comment
      @blog_comment = BlogComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_comment_params
      params.require(:blog_comment).permit(:content, :author, :blog_id, :user_id)
    end
end
