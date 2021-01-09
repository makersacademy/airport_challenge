require "plane"
require "airport"

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it 'should instruct a plane to land' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'should raise error when airport full' do
    plane = Plane.new
    subject.capacity.times { subject.land(plane) }
    expect { subject.land(plane) }.to raise_error "Airport is full"
  end

  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it 'should instruct a plane to take off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.takeoff(plane)).to eq "#{plane} has left the Airport"
  end


  it 'should return true or false if full' do
    expect(subject.send(:full?)).to eq false
    subject.capacity.times { subject.land(Plane.new) }
    expect(subject.send(:full?)).to eq true
  end
end
