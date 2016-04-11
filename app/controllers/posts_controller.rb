class PostsController < ApplicationController
  def index
    @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:content))

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = post.find(params[:id])
  end

  def destroy
    @post = post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
