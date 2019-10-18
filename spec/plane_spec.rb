require 'plane'
require 'airport'

describe Plane do
  subject { Plane.new }
 
  it 'Can create an instance of plane' do
    expect(subject).to be_instance_of Plane
  end

  it 'Planes status can be "landed"' do
    airport = Airport.new(5)
    subject.land(airport)
    expect(subject.grounded).to eq true
  end
end  
