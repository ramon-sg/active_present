require 'rails/generators'

module ActivePresent
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_ability
        template 'application_presenter.rb', 'app/presenters/application_presenter.rb'
      end
    end
  end
end