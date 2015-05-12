require 'spec_helper'

module ActivePresent
  module Generators
    describe InstallGenerator, type: :generator do
      destination File.expand_path("../../tmp", __FILE__)
      # arguments %w(something)

      before :all do
        prepare_destination
        run_generator
      end

      after :all do
        rm_rf(destination_root)
      end

      it 'all files are properly created' do
        assert_file 'app/presenters/application_presenter.rb'
      end
    end
  end
end