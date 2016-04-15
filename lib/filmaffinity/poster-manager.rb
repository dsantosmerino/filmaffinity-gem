require "open-uri"
require "imgur"





class PosterManager
  def initialize
    #call config file to get id or put your own imgur id.
    @client = Imgur.new("id")
  end


  def load_poster(posterurl)
    upload(posterurl)
  end
  
  def upload(posterurl)
    @dir = __dir__ + "/" + construct_name + ".jpg"
    save_img_locally(posterurl)
    image = Imgur::LocalImage.new(@dir)
    uploaded = @client.upload(image)
    File.delete(@dir)
    uploaded.link
  end

  def save_img_locally(posterurl)
    open(posterurl) {|f|
      File.open(@dir,"wb") do |file|
        file.puts f.read
      end
    }
  end

  def construct_name
    (0...8).map { (65 + rand(26)).chr }.join
  end
end
