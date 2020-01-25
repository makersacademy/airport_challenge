require 'plane'

describe Plane do

  it 'returns a plane' do
    expect(Plane.new).to be_truthy
    end
end

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport