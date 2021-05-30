# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

require 'airport.rb'
require 'plane.rb'

describe Airport do
  it 'instruct plane to land' do
    plane = Plane.new
    expect(plane.land).to eq("Plane landed!")
  end

  it 'plane take off and confirm' do
    plane = Plane.new
    expect(plane.take_off).to eq("Plane taken off! No longer at airport.")
  end

end
