class Api::V1::UsersController < ApplicationController
  def create
      @user = User.new(user_params)

      if @user.password != @user.password_confirmation || @user.password.empty?
        render json: { error: "Unsuccessful request" }, status: 400
      elsif User.find_by(email: @user[:email]).present?
        render json: { error: "User is already registered" }, status: 400
      else
        @user.save
        @user.update(api_key: SecureRandom.hex)
        render json: UsersSerializer.new(@user), status: :created
      end
    end


  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
