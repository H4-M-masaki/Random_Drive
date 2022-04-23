class Public::PostsController < ApplicationController

   before_action :correct_user, only: [:edit]

  def index
    @posts = Post.page(params[:page]).per(6).reverse_order
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to public_post_path(@post.id)
    else
      @posts = Post.all
      @user = current_user
      render:new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments.page(params[:page]).per(5).reverse_order
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path
    else
      render :edit
    end
  end

  #検索
  def search
   if params[:keyword].present?
     @posts = Post.where('title like?', "%#{params[:keyword]}%").page(params[:page]).per(6).reverse_order
     @keyword = params[:keyword]
   else
     @posts = Post.all.page(params[:page]).per(6).reverse_order
   end
  end

  private

    def post_params
      params.require(:post).permit(:image, :title, :body, :profile_image, :keyword, :user)
    end

    def correct_user
     @post = Post.find(params[:id])
     @user = @post.user
     if @user != current_user
      redirect_to user_path(current_user)
     end
    end
end
