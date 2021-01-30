require 'airport'
require 'plane'

RSpec.describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  describe '#approved_for_landing' do
    it 'parks a plane once it has landed' do
      airport.approved_for_landing("DLH430")
      expect(airport.planes).to include("DLH430")
    end

    it 'can tell air traffic control that capacity has reached maximum' do
      10.times do
        airport.approved_for_landing("DLH430")
      end
      allow(airport).to receive(:stormy?).and_return(false)
      expect { airport.approved_for_landing("DLH430") }.to raise_error(RuntimeError, "Plane cannot land because airport is at full capacity")
    end
  end

  describe '#plane_count' do
    it 'can check the amount of planes that are parked' do
      airport.approved_for_landing("DLH430")
      expect(airport.plane_count).to eq(1)
    end
  end

  describe '#approved_for_takeoff' do
    it 'takes a plane and removes it from the parking lot' do
      airport.approved_for_landing("DLH430")
      airport.approved_for_takeoff("DLH430")
      expect(airport.planes).not_to eq("DLH430")
    end

    it 'returns flight number of plane that took off' do
      airport.approved_for_landing("DLH430")
      expect(airport.approved_for_takeoff("DLH430")).to eq("DLH430")
    end
  end
  
  describe '#initialize' do
    it 'has an adaptable default capacity' do
      airport.capacity = 20
      expect(airport.capacity).to eq(20)
    end
  end
end
