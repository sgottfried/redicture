describe 'ImagesViewController' do

  before do
    @post = Post.new(title: 'test_title', thumbnail: 'test_image', full_size_pic: 'test_image')
    @posts = [@post]
    images_view_controller = ImagesViewController.alloc.init
    images_view_controller.stub!(:get_posts)
    images_view_controller.stub!(:posts, return: @posts)
    UINavigationController.alloc.initWithRootViewController(images_view_controller)
    self.controller = images_view_controller
  end

  tests ImagesViewController

  context 'table_view:cellForRowAtIndexPath' do
    it 'should add a photo to each cell' do
      image_views = views(UIImageView).select {|image_view| image_view.stylename == :thumbnail}
      image_views.size.should == 1
    end

    it 'should add a title to each cell' do
      view('test_title').should.not == nil
    end
  end
end
