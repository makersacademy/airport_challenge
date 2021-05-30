# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

require 'airport.rb'

describe Airport do
  it 'instruct plane to land' do
    plane = Airport.new
    expect(plane.land).to eq("Plane landed!")
  end

end
