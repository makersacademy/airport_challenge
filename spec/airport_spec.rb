require 'airport'

describe Airport do
  let(:landed_plane) { double(:landed_plane, landed?: true, takeoff: false) }
  let(:flying_plane) {double(:flying_plane, landed?: false, land: true) }

  subject(:airport) { Airport.new }
  subject(:airport_with_plane) do
    airport_with_plane = Airport.new
    airport_with_plane.planes_at_airport << landed_plane
    airport_with_plane
  end

  context 'when first created' do
    it 'has no planes' do
      expect(airport.planes_at_airport).to be_empty
    end
  end

  context 'planes interaction' do
    it 'after take-off plane no longer at airport' do
      #airport.planes_at_airport << landed_plane
      #puts "airport with plane: #{airport_with_plane} "
      airport_with_plane.instruct_takeoff(landed_plane)
      expect(airport.planes_at_airport).not_to include landed_plane
    end

    it 'after landing plane is at airport' do
      airport.instruct_land(flying_plane)
      expect(airport.planes_at_airport).to include flying_plane
    end

    it 'a plane cannot land if already landed' do
      airport.planes_at_airport << landed_plane
      expect(airport.instruct_land(landed_plane)).to eq Airport::ERR_ALREADY_LANDED
      expect(airport.planes_at_airport.count(landed_plane)).to eq 1
    end

    it 'a plane cannot take off if not at airport' do
      expect(airport.instruct_takeoff(landed_plane)).to eq Airport::ERR_PLANE_NOT_FOUND
    end
  end

  context 'when weather stormy' do
    it 'a plane can not take off' do
      allow(airport_with_plane).to receive(:good_weather?) { false }
      airport_with_plane.instruct_takeoff(landed_plane)
      expect(airport_with_plane.planes_at_airport).to include landed_plane
    end

    it 'a plane can not land' do
      allow(airport).to receive(:good_weather?) { false }
      airport.instruct_land(flying_plane)
      expect(airport.planes_at_airport).not_to include flying_plane
    end
  end

  context 'when full' do
    it 'a plane can not land' do
    end
  end





end