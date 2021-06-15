class Credit
  attr_reader :author,
              :taken,
              :url

  def initialize(info)
    @author = info[:owner][:realname]
    @taken = info[:dates][:taken]
    @url = "https://www.flickr.com/#{info[:owner][:path_alias]}/#{info[:id]}"
  end
end
