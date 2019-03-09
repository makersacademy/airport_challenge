require 'airport'
require 'plane'

describe Airport do

  airport = Airport.new
  plane = Plane.new

  it 'creates new airport object' do
    expect(Airport.new.is_a? Airport).to eq true
  end

  it { is_expected.to respond_to(:land) }

  it 'tells the plane to land' do
    expect(plane).to receive(:land)
    airport.land(plane)
  end

  it 'check same plane object is in the plane list after landing' do
    expect(plane).to receive(:land)
    airport.land(plane)
    expect(airport.plane_list).to include plane
  end

end
