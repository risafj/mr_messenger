ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# Refer to below link on how to use the minitest-reporters gem.
# https://github.com/kern/minitest-reporters
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Load seeds for all tests.
  # https://stackoverflow.com/questions/1574797/how-to-load-dbseed-data-into-test-database-automatically
  load Rails.root.join('db', 'seeds.rb')
end
