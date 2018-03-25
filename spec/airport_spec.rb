require 'airport'
require 'plane'
require 'weather'

describe Airport do

  subject(:airport) { described_class.new }

  describe "#planes_in airport" do

    let(:plane) { double('plane') }

  it 'stores a landed plane in the airport capacity' do

    airport.planes_in_airport = [plane, plane]
    expect(airport.planes_in_airport).to contain_exactly(plane, plane)

  end
end

  describe '#takeoff'

  it 'can be instructed to let a plane takeoff' do
    expect(airport).to respond_to(:takeoff)
  end

  it 'removes a plane from the airport capacity when instructed to takeoff' do
  # this test needs a plane double
  airport = Airport.new
  plane = Plane.new
  plane.land_plane(airport)
  airport.takeoff
  expect(airport.planes_in_airport).to eq []

  end



  it 'prevents plane takeoff when the weather is stormy' do


  end

end
