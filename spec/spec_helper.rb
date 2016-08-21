ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rack/test'

Capybara.app = MandrillAnalytics

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Rack::Test::Methods

  def app
    MandrillAnalytics
  end

  config.before(:suite) do
    NoBrainer.sync_schema
  end

  config.before(:each) do
    NoBrainer.purge!
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus

  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed
end
