require 'airport'

describe Airport do

  it 'check if airport capacity is set by default and can be overriden' do
    expect(subject.new_capacity(8)).to eq 8
  end

  it 'lands a plane in an airport' do
    plane = Plane.new
    expect(subject.land(plane)).to be(plane)
  end

  it  'plane takes off from airport' do
    plane = Plane.new
    expect(subject.take_off(plane)).to be(plane)
  end

  it 'to prevent landing when the airport is full' do
    subject.new_capacity(0)
    plane = Plane.new
    expect {subject.land(plane)}.to raise_error "Can't land, Airport is at full capacity"
  end

  it 'to prevent landing when the airport is full' do
    subject.new_capacity(0)
    plane = Plane.new
    expect {subject.land(plane)}.to raise_error "Can't land, Airport is at full capacity"
  end

end