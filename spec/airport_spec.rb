require 'airport'

describe Airport do
  let(:landed_plane) { double(:landed_plane, landed?: true, takeoff: false) }
  let(:flying_plane) {double(:flying_plane, landed?: false, land: true) }

  subject(:airport) { Airport.new }
  subject(:customised_airport) {Airport.new(37)}

  context 'when first created' do
    it 'has no planes' do
      expect(airport.planes_at_airport).to be_empty
    end
  end

  context 'planes standard behaviour' do
    it 'after take-off plane no longer at airport' do
      allow(airport).to receive(:stormy?) { false }
      airport.planes_at_airport << landed_plane
      airport.instruct_takeoff(landed_plane)
      expect(airport.planes_at_airport).not_to include landed_plane
    end

    it 'after landing plane is at airport' do
      allow(airport).to receive(:stormy?) { false }
      airport.instruct_land(flying_plane)
      expect(airport.planes_at_airport).to include flying_plane
    end
  end
  context 'edge cases' do
    it 'a plane cannot land if already landed' do
      #allow(airport).to receive(:stormy?) { false }
      airport.planes_at_airport << landed_plane
      #expect(airport.planes_at_airport.count(landed_plane)).to eq 1
      expect{ airport.instruct_land(landed_plane) }.to raise_error Airport::LANDED
    end

    it 'a plane cannot take off if not at airport' do
      #allow(airport).to receive(:stormy?) { false }
      expect{ airport.instruct_takeoff(flying_plane)}.to raise_error Airport::NOT_FOUND
    end
  end

  context 'when full' do
    before do
      Airport::DEFAULT_CAPACITY.times do
        airport.planes_at_airport << landed_plane
      end
    end

    it 'a plane can not land' do
      allow(airport).to receive(:stormy?) { false }
      expect{ airport.instruct_land(flying_plane)}.to raise_error Airport::FULL
      #expect(airport.planes_at_airport.size).to eq 20
      #expect(airport.planes_at_airport).not_to include flying_plane
    end
  end

  context 'capacity overrride' do
    it 'changes the default capacity' do
      expect(customised_airport.capacity).to eq 37
    end
  end

  context 'when stormy weather ' do

    it 'a plane can not take off' do
      allow(airport).to receive(:stormy?) { true }
      airport.planes_at_airport << landed_plane
      #airport.instruct_takeoff(landed_plane)
      #expect(airport.planes_at_airport).to include landed_plane
      expect{airport.instruct_takeoff(landed_plane)}.to raise_error Airport::STORMY
    end

    it 'a plane can not land' do
      allow(airport).to receive(:stormy?) { true }
      #airport.instruct_land(flying_plane)
      #expect(airport.planes_at_airport).not_to include flying_plane
      expect{airport.instruct_land(flying_plane)}.to raise_error Airport::STORMY
    end
  end
end