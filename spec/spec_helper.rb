$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV["RAILS_ENV"] ||= 'test'

require 'rspec'

require 'rails/all'

require 'support/version_helper'

require 'rspec/rails'
require 'generator_spec'
require 'factory_girl'
require 'database_cleaner'

require 'generators/active_present/install/install_generator'

require File.expand_path('../dummy/config/environment', __FILE__)

require 'active_present'

# load migrations
ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate(File.join(Rails.root, 'db/migrate'))

# Load support files
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load factories
FactoryGirl.definition_file_paths = ["#{File.dirname(__FILE__)}/factories"]
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.mock_with :rspec
  # config.use_transactional_fixtures = true
  # config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  # Factory Girl
  config.include FactoryGirl::Syntax::Methods

  # database_cleaner
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end
end