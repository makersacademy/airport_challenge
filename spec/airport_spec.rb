
require 'airport'

DEFAULT_CAPACITY = 50

describe Airport do

  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :take_off}

describe 'plane takes off' do
  it 'instructs plane to take off' do
    subject { dockingstation = DockingStation.new }
    subject { plane = Plane.new }
    subject.land(plane)
   #expect(subject.plane).to eq plane
 end

 end

end
