require 'airport'
require 'plane'

describe Airport do

  it 'Instructs plane to land and confirms it has landed' do
    plane = Plane.new
    subject.weather = "sunny"
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

end
