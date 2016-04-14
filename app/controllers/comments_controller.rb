class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    # puts params
    user_id = session[:user_id]
    @comment = User.find(user_id).posts.find(:post_id).comments.create(comment_params)
    if @comment.save
      redirect_to :posts
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params.require(:comment).permit(:content, :user_id, :post_id))
      redirect_to root_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  def comment_params
    permit.require(:comment).permit(:content, :user_id, :post_id)
  end
end

