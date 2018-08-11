require 'airport'
require 'plane'

describe Airport do

  new_airport = Airport.new
  new_plane = Plane.new
  new_airport.landing(new_plane)

  it 'responds to #landing' do
    expect(subject).to respond_to(:landing).with(1).argument
  end

  it 'stores the names of the planes landing in an array' do
    expect(new_airport.planes_on_ground).to eq ([new_plane])
  end

  it 'removes a plane from the array when 1 takes off' do
    expect(new_airport.take_off(new_plane)).to eq (new_plane)
  end
end
