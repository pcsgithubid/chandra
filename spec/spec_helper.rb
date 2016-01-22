
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

# Add this to load Capybara integration:
  require 'capybara/rspec'
  require 'capybara/rails'
  config.include Capybara::DSL
  Capybara.default_driver = :webkit
  Capybara.automatic_reload  = false
end

