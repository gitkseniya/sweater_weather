class Api::V1::ImagesController < ApplicationController
  def index
    images = ImagesFacade.get_images(params[:location])

    render json: ImageSerializer.new(images)
  end
end
