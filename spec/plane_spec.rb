require 'plane'
require 'airport'

describe Plane do

  # Airport instance
  airport = Airport.new("Heathrow")

  # Weather doubles
  let(:weather_fine) { double :weather, :stormy? => false }
  let(:weather_stormy) { double :weather, :stormy? => true }

  # Check methods exist
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:takeoff) }

  # User story tests
  it 'land at airport' do
    expect(subject.land(airport, weather_fine)).to eq("Landed at Heathrow")
  end

  it 'take off from airport' do
    expect(subject.takeoff(airport, weather_fine)).to eq("Departed from Heathrow")
  end

  it 'should not land if airport is full' do
    airport = Airport.new("Heathrow")
    airport.capacity.times { Plane.new.land(airport, weather_fine) }
    expect { subject.land(airport, weather_fine) }.to raise_error("Airport full")
  end

  it 'should not takeoff if weather is stormy' do
    expect { subject.takeoff(airport, weather_stormy) }.to raise_error("Can't take off, too stormy")
  end

end
