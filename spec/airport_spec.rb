# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
require 'airport.rb'

describe Airport do
  it 'instruct plane to land' do
    plane = Airport.new
    expect(plane.land).to eq("Plane landed!")
  end

end
