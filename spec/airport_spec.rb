require 'airport'
require 'plane'

describe Airport do
  it {is_expected.to respond_to(:land).with(1).argument}
  it 'allows a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to be_instance_of(Plane)
  end
end
