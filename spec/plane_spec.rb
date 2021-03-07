require 'plane'

describe Plane do
  it 'is in the air when created' do
    expect(subject).to be_in_air
  end

  it 'can take off' do 
    subject.ready_for_takeoff?
    expect(subject).to_not be_in_air
  end

  it 'can land' do 
    subject.ready_to_land?
    expect(subject).to be_in_air
  end

end 

