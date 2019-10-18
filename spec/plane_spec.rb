require 'plane'

describe Plane do
  subject { Plane.new }
 
  it 'Can create an instance of plane' do
    expect(subject).to be_instance_of Plane
  end

  it 'Planes status can be "landed"' do
    subject.land(airport)
    expect(subject.landed?).to eq true
  end
end  
