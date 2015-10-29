require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  let(:plane) { double(:plane, flying: :plane, landed: :plane, flying?: true) }

  before { allow(airport).to receive(:stormy?) { false } }

  describe '#initializing capacity' do

    it 'has a #DEFAULT_CAPACITY of 20' do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'has an overridden capacity when specified' do
      airport = Airport.new(50)
      expect(airport.capacity).to eq 50
    end
  end

  describe '#land' do

    it 'lands a plane' do
    expect(airport).to respond_to(:land).with(1).argument
    end

    context 'does not land a plane when:' do

      it 'airport is full' do
          described_class::DEFAULT_CAPACITY.times { airport.land(plane) }
          expect{airport.land(plane)}.to raise_error 'Airport is full!'
      end

      it 'weather is stormy' do
          allow(airport).to receive(:stormy?) { true }
          error_msg = 'Landing denied. Weather is stormy!'
          expect{airport.land(plane)}.to raise_error error_msg
      end

      it 'plane is already landed and is in the airport' do
        allow(plane).to receive(:flying?) { false }
        expect(airport.land(plane)).to eq 'Plane has already landed'
      end
    end
  end

  describe '#take_off' do

    it 'takes off a plane' do
      expect(airport).to respond_to(:take_off)
    end

      context 'does not take off a plane when:' do

        it 'weather is stormy' do
        airport.land(plane)
        allow(airport).to receive(:stormy?) { true }
        error_msg = 'Take-off denied. Weather is stormy!'
        expect{airport.take_off}.to raise_error error_msg
        end

        it 'it is already flying' do
        allow(plane).to receive(:location) { :air }
        airport.land(plane)
        airport.take_off
        expect(plane.location).to be :air
        end
      end

    it 'plane is no longer in airport after take-off' do
      airport.land(plane)
      airport.take_off
      expect(airport.planes).to be_empty
    end
  end

      context '#stormy? returns:' do

        it "'true' when greater than 0.95" do
        x = rand(0.96..1.0)
        expect(x > 0.95).to eq true
        end

        it "'false' when less than 0.95" do
        x = rand(0..0.95)
        expect(x > 0.95).to eq false
        end
      end
end
