class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end


  private
   def post_params
     params.require(:post).permit(:image, :title, :body, :profile_image, :keyword)
   end


end
