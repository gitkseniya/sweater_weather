class Api::V1::ImagesController < ApplicationController
  def index
    if params[:location].present?
      images = ImagesFacade.get_images(params[:location])

      render json: ImageSerializer.new(images)
    else
      invalid_params
    end
  end
end
