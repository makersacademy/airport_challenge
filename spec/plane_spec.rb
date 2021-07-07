require 'plane'
require 'airport'

describe Plane do
  subject { Plane.new }
 
  it 'Can create an instance of plane' do
    expect(subject).to be_instance_of Plane
  end

  it 'Planes status can be "Grounded"' do
    airport = Airport.new
    weather = double(:weather, status: "Sunny")
    subject.take_off(airport,weather)
    subject.land(airport,weather)
    expect(subject.grounded).to eq true
  end

  it 'Planes status can be not be "Grounded"' do
    airport = Airport.new
    weather = double(:weather, status: "Sunny")
    subject.take_off(airport,weather)
    expect(subject.grounded).to eq false
  end

  it 'Will not allow a plane to land when airport is full' do
    airport = Airport.new(1)
    weather = double(:weather, status: "Sunny")
    plane1 = Plane.new
    plane1.take_off(airport,weather)
    plane1.land(airport,weather)
    plane2 = Plane.new
    plane2.take_off(airport,weather)
    expect { plane2.land(airport, weather) }.to raise_error "No space available"
  end
  it 'Will not allow a plane to take off if its already taken off' do
    airport = Airport.new
    weather = double(:weather, status: "Sunny")
    subject.take_off(airport,weather)
    expect { subject.take_off(airport,weather) }.to raise_error "Plane already taken off"
  end
  it 'Will not allow a plane to land if it has already landed' do
    airport = Airport.new
    weather = double(:weather, status: "Sunny")
    subject.take_off(airport,weather)
    subject.land(airport,weather)
    expect { subject.land(airport,weather) }.to raise_error "Plane already landed"
  end
end  
