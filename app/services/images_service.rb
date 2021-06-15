class ImagesService < BaseService

  def self.get_images(location)
    response = conn('https://www.flickr.com').get('/services/rest') do |f|
      f.params['method'] = 'flickr.photos.search'
      f.params['api_key'] = ENV['flickr_key']
      f.params['text'] = location
      f.params['per_page'] = 1
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = 1
    end
    format_json(response)
    # return '22377206314' if format_json(response)[:photos][:total] == '0' || location == ''
    # format_json(response)[:photos][:photo][0][:id]
  end

  def self.get_info(location)
    response = conn('https://www.flickr.com').get('/services/rest') do |f|
      f.params['api_key'] = ENV['flickr_key']
      f.params['format'] = 'json'
      f.params['nojsoncallback'] = 1
      f.params['method'] = 'flickr.photos.getInfo'
      f.params['photo_id'] = get_images(location)
    end
    format_json(response)[:photo]
  end

end
