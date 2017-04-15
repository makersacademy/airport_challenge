require 'airport'
require 'plane'

describe Airport do

  it 'Instructs plane to land and confirms it has landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.slots[-1].object_id).to eq plane.object_id
  end

  it 'Instructs plane to takeoff and confirms it has left' do
    subject.slots.push(Plane.new)
    subject.weather = "sunny"
    subject.takeoff(0)
    expect(subject.slots.empty?).to eq true
  end

  it 'Prevents takeoff when weather is stormy' do
    subject.slots.push(Plane.new)
    subject.weather = "stormy"
    expect{subject.takeoff(0)}.to raise_error "Weather conditions too dangerous for take-off"
  end

  it 'Prevents landing when weather is stormy' do
    subject.weather = "stormy"
    expect{subject.land(Plane.new)}.to raise_error "Weather conditions too dangerous for landing"
  end

  it 'Allows takeoff when weather is sunny' do
    plane = Plane.new
    subject.slots.push(plane)
    subject.weather = "sunny"
    expect(subject.takeoff(0).object_id).to eq plane.object_id
  end

  it 'Allows landing when weather is sunny' do
    plane = Plane.new
    subject.weather = "sunny"
    subject.land(plane)
    expect(subject.slots[-1].object_id).to eq plane.object_id
  end

  it 'Prevents landing when airport is full' do
    subject.slot_limit.times { subject.land(Plane.new) }
    expect{subject.land(Plane.new)}.to raise_error "All airport landing slots currently occupied"
  end

  it 'Sets a default slot limit that can be overriden upon initialization' do
    airport = Airport.new(40)
    40.times { airport.land(Plane.new) }
    expect(airport.slot_limit).to eq 40
    expect{airport.land(Plane.new)}.to raise_error "All airport landing slots currently occupied"
  end
end
