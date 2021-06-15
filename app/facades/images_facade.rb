class ImagesFacade

  def self.get_images(location)
    data = ImagesService.get_images(location)

    Image.new(data)
  end

end
