require 'plane'
require 'airport'

describe Plane do
  it 'can create instances of Plane class' do
    expect(subject).to be_instance_of(Plane)
  end

  it 'can land at an airport' do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes[0]).to eq(subject)
  end

  it 'can take off from an airport' do
    airport = Airport.new
    subject.land(airport)
    subject.take_off
    expect(airport.planes).to be_empty
  end

  it 'knows whether it is airborne or landed' do
    expect(subject.is_landed?).to be false
    airport = Airport.new
    subject.land(airport)
    expect(subject.is_landed?).to be true
  end

  it 'fails when trying to land a landed plane' do
    airport = Airport.new
    subject.land(airport)
    expect{subject.land(airport)}.to raise_error
  end

  it 'fails when trying to take off an airborne plane' do
    expect{subject.take_off}.to raise_error
  end
end
