require 'coveralls'
Coveralls.wear!
RSpec.configure do |config|
  config.before(:each) do
    allow_any_instance_of(Airport).to receive(:stormy?).and_return(false)
  end
end
