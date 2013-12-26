class ImagesViewController < UIViewController
  def viewDidLoad
    hello_label = UILabel.alloc.initWithFrame [[0,0],[UIScreen.mainScreen.bounds.size.width,50]]
    hello_label.text = 'hello, world!'
    hello_label.textColor = :white.uicolor
    self.view.addSubview(hello_label)

    BW::HTTP.get("http://imgur.com/r/all.json") do |response|
      hash = BW::JSON.parse response.body.to_str
      hash = hash['data']
      hash.each do |link|
        puts "http://i.imgur.com/#{link['hash']}b#{link['ext']}"
      end
    end
  end
end
