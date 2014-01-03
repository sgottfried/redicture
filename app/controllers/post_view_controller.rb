class PostViewController < UIViewController
  
  stylesheet :post_screen

  def initWithPost(post)
    @post = post
    self
  end

  def viewWillAppear(animated)
    super
    self.view.backgroundColor = :white.uicolor
    photo_view = subview(UIImageView, :full_size_photo) 
    photo_view.image = @post.full_size_from_hash .uiimage
  end
end
