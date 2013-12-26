class ImagesViewController < UIViewController
  def viewDidLoad
    hello_label = UILabel.alloc.initWithFrame [[0,0],[UIScreen.mainScreen.bounds.size.width,50]]
    hello_label.text = 'hello, world!'
    hello_label.textColor = :white.uicolor
    self.view.addSubview(hello_label)
  end
end
