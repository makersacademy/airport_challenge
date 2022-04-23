require 'airport'
require 'plane'

describe Airport do
  
  it 'class Airport works' do
    expect(subject).to be_a_kind_of(Airport)
  end

  it 'plane can land in an airport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'plane can take off from an airport' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'take_off method confirms plane is not longer in the airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq ("#{plane} no longer in #{subject} airport")
  end

  it 'raise an error if airport is full and try to landd a plane' do
    subject.land(Plane.new)
    expect { subject.land(Plane.new) }.to raise_error
  end

  it 'capacity of airport can be overriden' do
    subject.capacity = 20
    expect(subject.capacity).to eq(20)
  end

end
