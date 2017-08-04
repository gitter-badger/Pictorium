class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.save ? redurect_to @post, notice: 'Post was successfully created.' : render :new
  end

  # PATCH/PUT /posts/1
  def update
    @post_update(post_params) ? redirect_to @post, notice: 'Post was successfully updated.'
                              : render :edit
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redurect_to posts_url, notice: 'Post was successfully destoryed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {})
    end
end
