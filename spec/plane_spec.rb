require 'plane'
require 'airport'

describe Plane do
  subject { Plane.new }
 
  it 'Can create an instance of plane' do
    expect(subject).to be_instance_of Plane
  end

  it 'Planes status can be "Grounded"' do
    airport = Airport.new
    subject.land(airport)
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
    plane1 = Plane.new
    plane1.land(airport)
    plane2 = Plane.new
    expect { plane2.land(airport) }.to raise_error "No space available"
  end
end  
