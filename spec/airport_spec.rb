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

  context 'interaction with planes' do
    it 'is no longer in the airport after takeoff' do
      #airport.planes_at_airport << landed_plane
      #puts "airport with plane: #{airport_with_plane} "
      airport_with_plane.instruct_takeoff(landed_plane)
      expect(airport.planes_at_airport).not_to include landed_plane
    end

    it 'is in the airport after landing' do
      airport.instruct_land(flying_plane)
      expect(airport.planes_at_airport).to include flying_plane
    end

    it 'cannot land a plane already landed' do
      airport.planes_at_airport << landed_plane
      expect(airport.instruct_land(landed_plane)).to eq Airport::ERR_ALREADY_LANDED
      expect(airport.planes_at_airport.count(landed_plane)).to eq 1
    end

    it 'cannot take off a plane if not here' do

    end
  end


  # context 'when weather stormy' do
  #   xit 'prevents take offs' do
  #     airport.planes_at_airport << plane
  #     airport.take_off(plane)
  #   end
  # end


end