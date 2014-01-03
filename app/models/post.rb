class Post
  attr_reader :image_hash
  attr_reader :thumbnail
  attr_reader :title

  def initialize(args)
    @title = args[:title]
    @image_hash = args[:image_hash]
  end

  def full_size_from_hash
    "http://i.imgur.com/#{@image_hash}.png".nsurl.nsdata
  end

  def thumbnail_from_hash
    "http://i.imgur.com/#{@image_hash}b.png".nsurl.nsdata
  end
end
