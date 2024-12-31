# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_user
    @current_user ||= begin
                        token = cookies.signed[:jwt]
                        decoded_token = decode_jwt(token)
                        User.find(decoded_token["user_id"]) if decoded_token
                      rescue JWT::DecodeError
                        nil
                      end
  end
  helper_method :current_user

  private

  def decode_jwt(token)
    JWT.decode(token, Rails.application.secret_key_base).first
  end

  def authenticate_user!
    redirect_to login_path unless current_user
  end
end
