require 'workarea/testing/teaspoon'
Teaspoon.configure do |config|
  config.root = Workarea::Margin::Engine.root
  Workarea::Teaspoon.apply(config)
end
