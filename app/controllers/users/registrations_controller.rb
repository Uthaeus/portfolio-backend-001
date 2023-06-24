# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user!, only: [:update, :destroy]
  respond_to :json

  protected 

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :avatar, :password, :password_confirmation])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :avatar, :password, :password_confirmation, :current_password])
  end

  private 

  def respond_with(resource, _opts = {})
    if request.method === "POST" && resource.persisted?
      render json: {
        status: {code: 200, message: 'Signed up sucessfully.'},
        data: resource
      }, status: :ok
    elsif request.method === "PUT" && resource.persisted? 
      @user = User.find_by(id: current_user.id)
      @user.update({username: resource.username, email: resource.email, password: resource.password, password_confirmation: resource.password_confirmation})
      render json: {
        status: {code: 200, message: 'Updated sucessfully.'},
        data: resource
      }, status: :ok
    elsif request.method === "DELETE"
      @user = User.find_by(id: current_user.id)
      @user.destroy
      render json: {
        status: {code: 200, message: 'Deleted sucessfully.'},
        data: @user
      }, status: :ok
    else
      render json: {
        status: {message: "User could not be created or updated"},
        data: resource.errors
      }, status: :unprocessable_entity
    end
  end
end
