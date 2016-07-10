require 'airport'
require 'plane'
describe Airport do
  it 'instructs a plane to land' do
    airport = double('airport')
    plane = Plane.new
    allow(airport).to receive(:land_plane).with(plane).and_return(plane)
  end
  it 'confirms that plane has landed' do
    airport = double('airport')
    allow(airport).to receive(:land_plane).with(Plane.new).and_return(:landed)
  end
  it 'instructs a plane to depart' do
    airport = double('airport')
    plane = Plane.new
    subject.land_plane(plane)
    allow(airport).to receive(:depart_plane).with(plane).and_raise('weather conditions prvent take-off')
  end
  it 'confirms that plane departured' do
    plane = Plane.new
    subject.land_plane(plane)
    airport = double('airport')
    allow(airport).to receive(:depart_plane).with(plane).and_return(:departed)
  end
  it 'prevents landing if weather is stormy' do
    airport = double('airport')
    allow(airport).to receive(:land_plane).and_raise('weather conditions prvent landing')
  end
end
