require "plane"
require "airport"

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it 'should land at the said airport' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq plane
  end
end
