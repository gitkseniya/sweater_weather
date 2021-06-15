class Api::V1::UsersController < ApplicationController
  def create
    if user_params[:email]
      new_user = user_params
      new_user[:email] = user_params[:email].downcase
    else
      return render json: { error: "Please fill out email" }, status: 400
    end

    @user = User.create(new_user)
    if @user.save
      @user.update_api_key

      render json: UsersSerializer.new(@user), status: 201
    else
      render json: { error: "Unsuccessful request" }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
