require 'xplosion/xplosion_helper'
module MyGem
  class Railtie < Rails::Railtie
    initializer "xplosion.xplosion_helper" do
      ActionView::Base.send :include, XplosionHelpers
    end
  end
end
