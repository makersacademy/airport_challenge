# Land at airport when space and sunny - SUCCESS
# Land at airport when full and sunny - ERROR
# Land at airport when stormy - ERROR
# Land at airport twice with same plane - ERROR

# Check plane is in hanger after landing - SUCCESS

# Take off from airport when plane is present - SUCCESS
# Take off from airport when plane is not present - ERROR
# Take off from airport when stormy - ERROR

# Check airport has a default capacity when instatiated
# Check capacity of airport can be changed

require 'airport'

RSpec.describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }
  let(:small_airport) { Airport.new(20) }
  it { expect(subject.hanger_capacity).to eq Airport::DEFAULT_HANGER_CAPACITY }
  it { expect(small_airport.hanger_capacity).to eq 20 }

  context 'when weather is stormy' do
    before(:each) do
      airport.land(plane)
      allow(airport).to receive(:stormy_weather?) { true }
    end
    it { expect { airport.take_off(plane) }.to raise_error("Too stormy for take off") }
    it { expect { airport.land(plane) }.to raise_error("Too stormy for landing") }
  end

  context 'when weather is sunny and specific plane has landed' do
    before(:each) do
      allow(airport).to receive(:stormy_weather?) { nil }
      airport.land(plane)
    end
    it { expect(airport.in_hanger?(plane)).to be true }
    it { expect { airport.land(plane) }.to raise_error("Plane has already landed") }
    it { expect(airport.take_off(plane)).to be plane }
    it { expect { airport.take_off(Plane.new) }.to raise_error("Plane not in hanger") }
  end

  context 'when weather is sunny and specific plane has landed and taken off' do
    before(:each) do
      allow(airport).to receive(:stormy_weather?) { nil }
      airport.land(plane)
      airport.take_off(plane)
    end
    it { expect(airport.in_hanger?(plane)).to be false }
  end

  context 'when weather is sunny and airport is full' do
    before(:each) do
      allow(airport).to receive(:stormy_weather?) { nil }
      100.times { airport.land(Plane.new) }
    end
    it { expect { airport.land(Plane.new) }.to raise_error("Airport is full") }
  end
end
