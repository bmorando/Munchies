class WelcomeController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]

  def index
  @posts = Post.all
  end
end
