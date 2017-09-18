class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :get_tag_list, only: [:create, :update]
  before_filter :authenticate_user!

  # GET /posts
  def index
    redirect_to user_session_path unless user_signed_in?
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def edit
    @edit_tag_list = @post.all_tags.pluck(:tag_name).join(',')
  end
  
  # POST /posts
  def create
    @post = current_user.posts.build post_params
    if @post.save
      @post.save_tags tag_list
      redirect_to @post, notice:  'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update post_params
      @post.save_tags tag_list
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
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
      params.require(:post).permit(:user_id, :image, :bookmark_count, :comment_count)
    end

    def get_tag_list
      tag_list = params[:tag_list].split ','
    end
end
