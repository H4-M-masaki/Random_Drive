class Public::PostsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end



  private
    def post_params
      params.require(:post).permit(:text, :image)
    end

end
