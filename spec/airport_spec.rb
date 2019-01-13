require 'airport'

RSpec.describe Airport do
  let(:airport) { Airport.new }
  let(:small_airport) { Airport.new(20) }
  let(:plane) { Plane.new }

  it { expect(airport.hanger_capacity).to eq Airport::DEFAULT_HANGER_CAPACITY }
  it { expect(small_airport.hanger_capacity).to eq 20 }

  context 'when weather is stormy' do
    before(:each) do
      allow(airport).to receive(:stormy_weather?) { true }
    end
    it { expect { airport.take_off(plane) }.to raise_error("Too stormy for take off") }
    it { expect { airport.land(plane) }.to raise_error("Too stormy for landing") }
  end

  context 'when weather is sunny' do
    before(:each) do
      allow(airport).to receive(:stormy_weather?) { nil }
    end

    context 'when specific plane has landed' do
      before(:each) do
        airport.land(plane)
      end
      it { expect(airport.in_hanger?(plane)).to be true }
      it { expect { airport.land(plane) }.to raise_error("Plane has already landed") }
      it { expect(airport.take_off(plane)).to be plane }
      it { expect { airport.take_off(Plane.new) }.to raise_error("Plane not in hanger") }
    end

    context 'when specific plane has landed and taken off' do
      before(:each) do
        airport.land(plane)
        airport.take_off(plane)
      end
      it { expect(airport.in_hanger?(plane)).to be false }
    end

    context 'when airport is full' do
      before(:each) do
        100.times { airport.land(Plane.new) }
      end
      it { expect { airport.land(Plane.new) }.to raise_error("Airport is full") }
    end
  end
end
