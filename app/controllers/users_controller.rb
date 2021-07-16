class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @time = Time.now
  end

  def create
    @user = User.new(user_params)
    if @user.save # if this returns true, means that it is valid
      log_in @user
      flash[:success] = "Welcome to my app!"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
