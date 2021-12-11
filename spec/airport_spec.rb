require 'airport'

describe Airport do

  it 'check if airport capacity can be overriden' do
    expect(subject.new_capacity(8)).to eq 8
  end

  it 'lands a plane in an airport' do
    plane = Plane.new
    subject.set_weather(2)
    expect(subject.land(plane)).to be(plane)
  end

  it  'plane takes off from airport' do
    plane = Plane.new
    subject.set_weather(2)
    subject.land(plane)
    expect(subject.take_off(plane)).to be(plane)
  end

  it 'to prevent landing when the airport is full' do
    subject.new_capacity(0)
    plane = Plane.new
    expect {subject.land(plane)}.to raise_error "Can't land, Airport is at full capacity"
  end

  it 'to prevent take off when no planes in airport' do
    subject.new_capacity(0)
    plane = Plane.new

    expect {subject.take_off(plane)}.to raise_error "No planes in the airport"
  end

  it 'to prevent take off when weather is stormy' do
    subject.set_weather(2)
    plane = Plane.new
    subject.land(plane)
    subject.set_weather(1)

    expect {subject.take_off(plane)}.to raise_error "Can't take off, weather is stormy"
  end

  it 'to prevent landing when weather is stormy' do
    subject.set_weather(1)
    plane = Plane.new
    
    expect {subject.land(plane)}.to raise_error "Can't land, weather is stormy"
  end

end