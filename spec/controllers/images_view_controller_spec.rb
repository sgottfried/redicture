describe 'ImagesViewController' do

  before do
    @post = Post.new('test_image', 'test_image')
    @posts = [@post]
    images_view_controller = ImagesViewController.alloc.init
    images_view_controller.stub!(:get_posts)
    images_view_controller.stub!(:posts, return: @posts)
    self.controller = images_view_controller
  end

  tests ImagesViewController

  context 'table_view:cellForRowAtIndexPath' do
    it 'should add a photo to each cell' do
      image_views = views(UIImageView).select {|image_view| image_view.stylename == :reddit_picture}
      image_views.size.should == 1
    end
  end
end
