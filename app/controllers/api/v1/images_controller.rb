class Api::V1::ImagesController < ApplicationController
  def index
    @images = ImagesFacade.get_images(params[:location])
  end
end
