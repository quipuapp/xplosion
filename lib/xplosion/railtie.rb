require 'xplosion/xplosion_helper'
module Xplosion
  class Railtie < Rails::Railtie
    initializer "xplosion.xplosion_helper" do
      ActionView::Base.send :include, XplosionHelpers
    end
  end
end
