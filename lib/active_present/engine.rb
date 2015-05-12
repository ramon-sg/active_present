module ActivePreset
  class Engine < Rails::Engine
    initializer 'active_present.presenter_helper' do |app|
      ActiveSupport.on_load :action_controller do
        include ActivePresent::PresenterHelper
      end
    end
  end
end