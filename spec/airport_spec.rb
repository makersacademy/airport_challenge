require "plane"
require "airport"

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it 'should instruct a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it {is_expected.to respond_to(:takeoff).with(1).argument}
  it 'should instruct a plane to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} has left the Airport"
  end
end
