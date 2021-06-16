class ApplicationController < ActionController::API
  def invalid_params
    render json: { data: {}, error: 'Invalid params'}, status: 400
  end
end
