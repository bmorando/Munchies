class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
        flash[:success] = 'You are registered!'
        redirect_to post_path user.id
    else
        flash[:error] = 'Registration has failed!'
        redirect_to :posts
    end
  end

  def update
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
