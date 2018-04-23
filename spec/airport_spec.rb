require 'airport'
require 'plane'

describe AirPort do
  let(:airport) {AirPort.new}
  let(:plane) {Plane.new}

  it 'shoud respond to land method' do
    plane_in_bay = [plane]
    expect(airport.land(plane)).to eq plane_in_bay
  end
end
