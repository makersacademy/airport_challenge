require 'plane'

describe Plane do
  it 'allows a plane to take off and confirms that it is no longer in the airport' do
    plane = Plane.new
    airport = Airport.new
    expect(plane.take_off).to eq 'no longer in the airport'
  end
end
