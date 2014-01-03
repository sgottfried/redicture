class ImagesViewController < UITableViewController

  stylesheet :images_screen

  def viewWillAppear(animated)
    super
    self.title = 'Feed'
    get_posts
  end

  def tableView(table_view, numberOfRowsInSection:section)
    posts.length
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    cell_identifier = 'post_cell'
    cell = table_view.dequeueReusableCellWithIdentifier(cell_identifier) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:cell_identifier)

    post = posts[index_path.row]

    cell.contentView.subviews.each do |subview|
      subview.removeFromSuperview
      subview = nil
    end

    layout(cell.contentView, :root) do
      thumbnail = subview(UIImageView, :thumbnail)
      thumbnail.image = post.thumbnail_from_hash.uiimage

      title = subview(UILabel, :title)
      title.text = post.title
    end
    cell
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    post = posts[index_path.row]
    post_view_controller = PostViewController.alloc.initWithPost(post)
    self.navigationController.pushViewController(post_view_controller, animated:true)
  end

  def tableView(table_view, heightForRowAtIndexPath:index_path)
    195
  end

  private

  def posts
    @posts || []
  end

  def posts=(posts)
    @posts = posts
  end

  def get_posts
    BW::HTTP.get("http://imgur.com/r/all.json?perPage=10&page=1") do |response|
      hash = BW::JSON.parse response.body.to_str
      hash = hash['data']
      self.posts = hash.map do |post| 
        Post.new( 
                 title: post['title'], 
                 image_hash: post['hash'],
                )
      end
      self.tableView.reloadData
    end
  end
end
