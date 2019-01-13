require 'airport'

RSpec.describe Airport do
  let(:airport) { Airport.new }
  let(:small_airport) { Airport.new(1) }
  let(:plane) { double(:plane, landed: nil, make_land: true) }
  let(:plane2) { double(:plane, landed: nil, make_land: true) }

  it { expect(airport.hanger_capacity).to eq Airport::DEFAULT_HANGER_CAPACITY }
  it { expect(small_airport.hanger_capacity).to eq 1 }

  context 'when weather is stormy' do
    before(:each) do
      allow(airport).to receive(:stormy?) { true }
    end
    it { expect { airport.take_off(plane) }.to raise_error("Too stormy for take off") }
    it { expect { airport.land(plane) }.to raise_error("Too stormy for landing") }
  end

  context 'when weather is sunny' do
    before(:each) do
      allow(airport).to receive(:stormy?) { nil }
    end

    context 'when specific plane has landed' do
      before(:each) do
        airport.land(plane)
      end
      it { expect(airport.in_hanger?(plane)).to be true }
      it { expect { airport.land(plane) }.to raise_error("Plane has already landed") }
      it { expect(airport.take_off(plane)).to be plane }
      it { expect { airport.take_off(plane2) }.to raise_error("Plane not in hanger") }
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
        small_airport.land(plane)
      end
      it { expect { small_airport.land(plane2) }.to raise_error("Airport is full") }
    end

    context 'when plane is not in the air' do
      before(:each) do
        allow(plane).to receive(:landed) { true }
      end
      it { expect { airport.land(plane) }.to raise_error("Plane is not in air") }
    end

  end
end
