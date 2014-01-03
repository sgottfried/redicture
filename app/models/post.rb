class Post
  attr_reader :picture
  attr_reader :title
  
  def initialize(title, picture)
    @title = title
    @picture = picture
  end
end
