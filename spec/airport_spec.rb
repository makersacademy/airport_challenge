require 'airport'
require 'plane'
describe Airport do
it "ensures that flying planes can't take of or be in airport" do
  plane = Plane.new
  subject.land_plane(plane)
  subject.depart_plane(plane)
  expect(plane).not_to be_landed
end
it "ensures that landed planes can't land again" do
  plane = Plane.new
  subject.land_plane(plane)
  expect(plane).not_to be_departed
end
describe '#land_plane' do
  it 'instructs a plane to land' do
    airport = double('airport')
    plane = Plane.new
    allow(airport).to receive(:land_plane).with(plane).and_return(plane)
  end
  it 'confirms that plane has landed' do
    airport = double('airport')
    allow(airport).to receive(:land_plane).with(Plane.new).and_return(:landed)
  end
  it 'prevents landing if weather is stormy' do
    airport = double('airport')
    allow(airport).to receive(:land_plane).and_raise('weather conditions prvent landing')
  end
  it 'prevents landing if airport is full' do
    airport = double('airport')
    allow(airport).to receive(:land_plane).with(Plane.new).and_raise('airport is full, please use nearest one')
  end
end
describe '#depart_plane' do
  it 'prevents departure if weather is stormy' do
    airport = double('airport')
    # plane = Plane.new
    # subject.land_plane(plane)
    allow(airport).to receive(:depart_plane).with(Plane.new).and_raise('weather conditions prvent take-off')
  end
  it 'instructs a plane to depart' do
    airport = double('airport')
    plane = Plane.new
    # subject.land_plane(plane)
    allow(airport).to receive(:depart_plane).with(plane).and_return(plane)
  end
  it 'confirms that plane departured' do
    plane = Plane.new
    subject.land_plane(plane)
    airport = double('airport')
    allow(airport).to receive(:depart_plane).with(plane).and_return(:departed)
  end
end

end
