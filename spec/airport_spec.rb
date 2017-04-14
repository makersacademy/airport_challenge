require 'airport'
require 'plane'

describe Airport do
  plane = Plane.new
  it {is_expected.to respond_to(:land).with(1).argument}
  it {is_expected.to respond_to(:take_off)}
  it 'allows a plane to land' do
    expect(subject.land(plane).pop).to be_instance_of(Plane)
    expect(subject.land(plane)).to eq [plane]
  end
  it 'allows a plane to take off' do
    subject.land(plane)
    expect(subject.take_off.pop).to be_instance_of(Plane)
  end
  it 'raises an error when there are no planes' do
    expect{subject.take_off}.to raise_error(RuntimeError)
  end
end
