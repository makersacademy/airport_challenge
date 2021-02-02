require 'airport'
require 'plane'

RSpec.describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  
  describe '#approved_for_landing' do
    it 'is expected to respond to approved_for_landing' do
      expect(airport).to respond_to(:approved_for_landing).with(1).argument
    end
  
    it 'parks a plane once it has landed' do
      airport.approved_for_landing(plane)
      expect(airport.planes).to include(plane)
    end

    context 'when at capacity' do
      it 'does not allow landing' do
        plane = double :plane
        10.times do
          airport.approved_for_landing(plane)
        end
        allow(airport).to receive(:stormy?).and_return(false)
        expect { airport.approved_for_landing(plane) }.to raise_error(RuntimeError, "Plane cannot land because airport is at full capacity")
      end
    end

    context 'when stormy' do
      it 'does not allow landing' do
        airport.approved_for_landing(plane)
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.approved_for_landing(plane) }.to raise_error(RuntimeError, "Weather is still stormy, please wait for weather to improve before landing")
      end
    end
  end

  describe '#plane_count' do
    it 'can check the amount of planes that are parked' do
      airport.approved_for_landing(plane)
      expect(airport.plane_count).to eq(1)
    end
  end

  describe '#approved_for_takeoff' do
    it 'is expected to respond to approved_for_takeoff' do
      expect(airport).to respond_to(:approved_for_takeoff).with(1).argument
    end

    it 'takes a plane and removes it from the parking lot' do
      airport.approved_for_landing(plane)
      airport.approved_for_takeoff(plane)
      expect(airport.planes).not_to eq(plane)
    end

    it 'returns flight number of plane that took off' do
      airport.approved_for_landing(plane)
      expect(airport.approved_for_takeoff(plane)).to eq(plane)
    end
  end
  
  describe '#initialize' do
    it 'has an adaptable default capacity' do
      airport.capacity = 20
      expect(airport.capacity).to eq(20)
    end
  end
end
