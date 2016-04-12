class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  # before_action :only_my_post, only: [:edit, :update, :destroy]

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
  @post = Post.new(post_params)

    if @post.save
      redirect_to :posts
    else
      render :new
    end
  end

  # def edit
  # @post = Post.find(params[:id])
  # end

  def update
  @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to :posts
    else
      render :edit
    end
  end

  def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :content)
  end

  def set_post
      @post = Post.find(params[:id])
  end

  def only_my_post
    redirect_to posts_path, notice: "Not authorized!" if (current_user != @post.user)
  end

end



