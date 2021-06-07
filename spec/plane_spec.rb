require 'plane'

describe Plane do

  it 'can show that the plane can be landed' do
    subject.land
    expect(subject.landed?).to eq true
  end
  
  it 'can show that the plane can take off' do
    subject.land
    subject.take_off
    expect(subject.landed?).to eq false
  end

end
