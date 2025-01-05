class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new]
  def new
    redirect_to root_path if current_user
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
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('me', partial: 'users/profiles', locals: { user: current_user })
        end
        format.html { redirect_to me_path, notice: "Profile updated successfully." }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('me', partial: 'users/profiles', locals: { user: current_user })
        end
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def update_user_params
    params.require(:user).permit(:name, :username, :email, :password, :debt_percentage, :save_percentage, :expense_percentage)
  end
end
