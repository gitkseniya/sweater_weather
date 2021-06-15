class ImagesFacade

  def self.get_images(location)
    data = ImagesService.get_images(location)
    info = ImagesService.get_info(location)

    Image.new(data, info)
  end
end
