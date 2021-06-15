class Api::V1::SessionsController < Api::V1::UsersController
  def create
    return invalid_params if !user_params[:email] || !user_params[:password]

    @user = User.find_by(email: user_params[:email].downcase)
    if !@user.nil? && @user.authenticate(user_params[:password])
      render json: UsersSerializer.new(@user), status: 200
    else
      render json: { error: 'Invalid email or password' }, status: 400
    end
  end
end
