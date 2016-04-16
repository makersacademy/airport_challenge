require 'airport'

describe Airport do
  let(:plane) { double(:plane, landed?: true, land: true) }
  let(:airport) { Airport.new }

  context 'when first created' do
    it 'has no planes' do
      expect(subject.planes_at_airport).to be_empty
    end
  end

  context 'interaction with planes' do
    it 'is no longer in the airport after takeoff' do
      airport.planes_at_airport << plane
      airport.take_off(plane)
      expect(airport.planes_at_airport).not_to include plane
    end

    it 'is in the airport after landing' do
      airport.instruct_land(plane)
      expect(airport.planes_at_airport).to include plane
    end

    it 'cannot land a plane already landed' do
      airport.instruct_land(plane)
      expect(airport.instruct_land(plane)).to eq Airport::ERR_ALREADY_LANDED
      expect(airport.planes_at_airport.count(plane)).to eq 1
    end
  end


  # context 'when weather stormy' do
  #   xit 'prevents take offs' do
  #     airport.planes_at_airport << plane
  #     airport.take_off(plane)
  #   end
  # end


end