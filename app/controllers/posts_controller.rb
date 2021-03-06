class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :destroy, :create_comment]
  before_action :authenticate_user!

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @comments = @post.comments.order("created_at ASC")
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def edit
    if current_user.id == @post.user_id
      @edit_tag_list = @post.tags.pluck(:name).join(',')
    else
      redirect_to root_path, notice: 'This operation is not allowed.'
    end
  end
  
  # POST /posts
  def create
    @post = current_user.posts.build post_params
    tag_list = params[:tag_list].split(',')

    if @post.save
      @post.save_tags tag_list
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # POST /comment
  def create_comment
    @comment = @post.comments.build(comment_params)

    if @post.save
      redirect_to @post, notice: 'Comment was successfully created'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    tag_list = params[:tag_list].split(',')

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

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :comment)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      begin
        params.require(:post).permit(:user_id, :image, :bookmark_count, :comment_count)
      rescue 
        flash[:message] = "アップロードする画像を選択して下さい"
      end
    end
end
