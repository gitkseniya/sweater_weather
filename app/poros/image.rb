class Image
  attr_reader :id,
              :image

  def initialize(data)
    @id = nil
    @image = data[:photos][:photo][0]
  end
end
