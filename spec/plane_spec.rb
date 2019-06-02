require 'plane'
require 'airport'

describe Plane do

  it 'should be initialised with a state of being not at the airport' do
    expect(subject.instance_variable_get(:@at_airport)).to be false
  end

  it 'should set the instance variable at airport' do
    subject.in_hanger
    expect(subject.at_airport).to be true
  end
 
  it 'should unset the instance variable at airport' do
    subject.not_in_hanger
    expect(subject.at_airport).to be false
  end
 
end
