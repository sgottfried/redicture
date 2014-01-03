class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    return true if RUBYMOTION_ENV == 'test'

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    images_view_controller = ImagesViewController.alloc.init
    navigation_controller = UINavigationController.alloc.initWithRootViewController(images_view_controller)
    @window.rootViewController = navigation_controller
    @window.makeKeyAndVisible
    true
  end
end
