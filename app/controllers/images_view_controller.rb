class ImagesViewController < UITableViewController

  stylesheet :images_screen

  def viewWillAppear(animated)
    super
    BW::HTTP.get("http://imgur.com/r/all.json") do |response|
      hash = BW::JSON.parse response.body.to_str
      hash = hash['data']
      self.photos = hash.map { |thumbnail| "http://i.imgur.com/#{thumbnail['hash']}b#{thumbnail['ext']}".nsurl.nsdata }
      self.tableView.reloadData
    end
  end

  def tableView(table_view, numberOfRowsInSection:section)
    photos.length
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    cell_identifier = 'photo_cell'
    cell = table_view.dequeueReusableCellWithIdentifier(cell_identifier) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:cell_identifier)
      #NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.example.com/exampleImage.png"]];
      #yourCell.image = [UIImage imageWithData:data];
      url = photos[index_path.row]
      layout(cell.contentView, :root) do
        photo = subview(UIImageView, :reddit_photo)
        photo.image = url.uiimage
      end
    cell
  end

  def tableView(table_view, heightForRowAtIndexPath:index_path)
    UIScreen.mainScreen.bounds.size.height / 1.7
  end

  private
  def photos
    @photos || []
  end

  def photos=(photos)
    @photos = photos
  end
end
