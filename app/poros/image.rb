class Image
  attr_reader :id,
              :image,
              :credit

  def initialize(data, info)
    @id = info[:id]
    @image = data[:photos][:photo][0]
    @credit = Credit.new(info)
  end
end
