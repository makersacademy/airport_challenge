require 'airport'
require 'plane'

describe Airport do
  plane = Plane.new
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off)}
  it 'allows a plane to land' do
    expect(subject.land(plane)).to be_instance_of(Plane)
  end
  it 'allows a plane to take off' do
    expect(subject.take_off).to be_instance_of(Plane)
  end
end
