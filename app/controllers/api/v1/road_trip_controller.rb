class Api::V1::RoadTripController < ApplicationController
  def create
    if roadtrip_params[:origin].empty? || roadtrip_params[:destination].empty?
      render json: { error: 'Origin or destination field is missing' }, status: 400
    elsif roadtrip_params[:api_key].empty?
      render json: { error: 'API key is missing' }, status: 401
    else
      trip_results
    end
  end

  private

  def roadtrip_params
    params.permit(:origin, :destination, :api_key)
  end

  def trip_results
    @trip = RoadTripFacade.get_trip_details(roadtrip_params[:origin], roadtrip_params[:destination])
      if @trip == 'You are not going there buddy'
        render json: { error: @trip }, status: 400
      else
        render json: RoadTripSerializer.new(@trip), status: 201
      end
  end
end
