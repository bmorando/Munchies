class CategoryBreakfastController < ApplicationController

  def index
    @post = Post.find(params[:category_id = 1])
  end


end
