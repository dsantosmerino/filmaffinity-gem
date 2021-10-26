# frozen_string_literal: true

require 'open-uri'
require 'imgur'

class PosterManager
  def load_poster(posterurl)
    return posterurl unless FilmAffinity.configuration.imgur_id

    upload(posterurl, FilmAffinity.configuration.imgur_id)
  end

  def upload(posterurl, api_id)
    imgur = Imgur.new(api_id)
    @dir = "#{__dir__}/#{random_name}.jpg"
    save_img_locally(posterurl)
    local_image = Imgur::LocalImage.new(@dir)
    uploaded = imgur.upload(local_image)
    File.delete(@dir)
    uploaded.link
  end

  def save_img_locally(posterurl)
    URI.parse(posterurl).open do |f|
      File.open(@dir, 'wb') do |file|
        file.puts f.read
      end
    end
  end

  def random_name
    SecureRandom.urlsafe_base64(8)
  end
end
