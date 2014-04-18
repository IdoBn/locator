# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'
require 'support/global_helpers'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  # factory girl configs
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  # setting stuff up
  config.include Locator::GlobalHelpers

  config.before(:each) do
    Checkin.any_instance.stub(:reverse_geocode) { 'some address' }
  end

  # setting up omniauth facebook
  RACK_ENV = ENV['ENVIRONMENT'] ||= 'test'
  OmniAuth.config.test_mode = true
  omniauth_hash =
      {:provider => "facebook",
       :uid      => "100008268030218",
       :info   => {:name       => "Sandra Amhbfhjcjbah Fallerman",
                   :email      => "yolxbjw_fallerman_1397751882@tfbnw.net "},
       :credentials => {:token => "CAAHZCkZAW3QYwBAJH2kNMfKQgGFnFlqGXgk8LjU27kSO2bZCygv5gjAiC9wvjs1vZBr8NGLP7m3PZBF057csvtK90UypSZCMa1HZBOnkAaiZA4BgjWn9egWcAbKRfycDQ8EmtbqLu5LLujyXR6z9ZAf9fkSPDRug3JLOd0io7zi3uKE8ej5lsEwi5e4wTqe3SP3EZD",
                        expires_at: "#{Time.now + 1.hour}"}
      }

  OmniAuth.config.add_mock(:facebook, omniauth_hash)
end


