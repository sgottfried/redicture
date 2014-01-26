# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'teacup'
require 'bubble-wrap/core'
require 'bubble-wrap/http'
require 'sugarcube-uikit'
require 'motion-stump'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'redicture'

  # provisioning information goes here 
  app.provisioning_profile = '/Users/sam/Library/MobileDevice/Provisioning Profiles/6E746B3A-54D2-454C-9A45-9608DCFEB65F.mobileprovision'
  app.codesign_certificate = 'iPhone Developer: Sam Gottfried (B7UM573FF8)'
  app.sdk_version = '7.0'
  app.deployment_target = '7.0'
end
