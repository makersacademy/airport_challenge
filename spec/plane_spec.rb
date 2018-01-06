require 'plane'
require 'airport'

describe Plane do
  it 'can create instances of Plane class' do
    expect(subject).to be_instance_of(Plane)
  end

  it 'can land at an airport' do
    airport = Airport.new
    subject.land(airport)
    expect(subject.airport).to eq airport
  end

  it 'can take off from an airport' do
    airport = Airport.new
    subject.land(airport)
    subject.take_off
    expect(subject.airport).to be_nil
  end

  it 'fails when trying to land a landed plane' do
    airport = Airport.new
    subject.land(airport)
    expect { subject.land(airport) }.to raise_error 'Plane is already landed'
  end

  it 'fails when trying to take off an airborne plane' do
    expect { subject.take_off }.to raise_error 'Plane is already airborne'
  end
end
