require 'workarea/margin'
module Workarea
  module Margin
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::Margin
    end
  end
end
