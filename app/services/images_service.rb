class ImagesService < BaseService

  def self.get_images(location)
    response = conn('https://www.flickr.com').get('/services/rest') do |f|
      f.params['text'] = location
      f.params['method'] = 'flickr.photos.search'
      f.params['api_key'] = ENV['flickr_key']
    end
    format_json(response)
  end

  def self.get_info(photo_id)
    response = conn('https://www.flickr.com').get('/services/rest') do |f|
      f.params['photo_id'] = photo_id
      f.params['method'] = 'flickr.photos.getInfo'
      f.params['api_key'] = ENV['flickr_key']
    end
    format_json(response)
  end

end
