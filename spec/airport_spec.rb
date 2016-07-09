require 'airport'
require 'plane'
describe Airport do
  it 'instructs a plane to land' do
    airport = double('airport')
    plane = Plane.new
    allow(airport).to receive(:land_plane).with(plane).and_return(plane)
  end
  it 'confirms that plane has landed' do
    airport = double
    allow(airport).to receive(:land_plane).with(Plane.new).and_return(:landed)
  end
  it 'instructs a plane to depart' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.depart_plane(plane)).to eq plane
  end
  it 'confirms that plane departured' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.depart_plane(plane)).to be_departed
  end
  it 'prevents landing if weather is stormy' do
    airport = double('airport')
    allow(airport).to receive(:land_plane).and_raise('weather conditions prvent landing')
  end
end
