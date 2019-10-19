# As an air traffic controller
# So I can get passengers to a destination
# # I want to instruct a plane to land at an airport
require 'airport'

describe Airport do
  it 'airport responds to plane' do
    Airport = Airport.new
    expect(subject).to respond_to (:plane)
  end
end
