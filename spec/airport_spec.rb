require 'airport'
require 'plane'
# require 'pry'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe Airport do
  subject(:airport) {described_class.new}
  it 'instructs a plane to land' do
  expect(airport).to respond_to(:land).with(1).argument
  end
end
