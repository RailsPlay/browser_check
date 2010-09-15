require 'rails/engine'
require 'action_controller/base'

module BrowserCheck
  class Engine < Rails::Engine
    initializer "browser_check.extend_controller"  do
      class ActionController::Base
        include BrowserInfo
        helper_method :browser_info
        helper do
          def browser_check
            render :partial => 'browser_check/browser_check'
          end
        end
      end
    end
  end
end
