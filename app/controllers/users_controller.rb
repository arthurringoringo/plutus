class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to login_path, notice: 'Account created successfully!'
    else
      flash[:alert] = "Something went wrong"
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end

  def update
    if current_user.update!(update_user_params)
      @user = current_user
      redirect_to :me, notice: "Account saved"
    else
      @user = current_user
      flash[:alert] = "Something went wrong"
      render :me
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def update_user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end
end
