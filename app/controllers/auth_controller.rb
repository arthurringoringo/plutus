# app/controllers/authentication_controller.rb
class AuthController < ApplicationController
  skip_before_action :authenticate_user!, only: [:login, :new]

  def new
    redirect_to root_path if current_user
    @user = User.new
  end

  def login

    user = User.find_by(username: params[:username])
    p params[:username]
    if user && user.authenticate(params[:password])
      token = encode_jwt(user.id)
      cookies.signed[:jwt] = { value: token, httponly: true, expires: 24.hours.from_now }
      redirect_to root_path
    else
      flash[:alert] = 'Invalid username or password'
      p flash
      render :new # No need for respond_to if it's just rendering HTML
    end
  end

  def logout
    cookies.delete(:jwt)
    redirect_to login_path, notice: 'Logged out'
  end

  private

  def encode_jwt(user_id)
    payload = { user_id: user_id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
