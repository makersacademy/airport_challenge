require 'coveralls'
Coveralls.wear!
# require 'simplecov'
# SimpleCov.start
RSpec.configure do |config|
  config.before(:each) do
    allow_any_instance_of(Weather).to receive(:randomize) { false }
  end
end
