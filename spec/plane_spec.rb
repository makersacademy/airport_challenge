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

  it 'Planes statys can be not be "Grounded"' do
    airport = Airport.new
    subject.take_off(airport)
    expect(subject.grounded).to eq false
  end
end  
