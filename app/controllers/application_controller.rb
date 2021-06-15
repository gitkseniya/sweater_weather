class ApplicationController < ActionController::API
  def invalid_params
    render json: { data: {}, error: 'invalid params'}, status: 400
  end
end
