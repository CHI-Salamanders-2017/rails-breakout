class UsersController < ApplicationController

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def new
   @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
