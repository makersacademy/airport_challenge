require 'airport'
require 'plane'

describe Airport do
  it 'allows planes to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it 'stores planes at the airport' do
    expect(subject.hangar).to be_an_instance_of(Array)
  end
  it 'adds the landed plane to the hangar' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hangar).to eq([plane])
  end
  it 'allows planes to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end
