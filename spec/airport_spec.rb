require 'airport'

describe Airport do
  let(:plane) { double(:plane, landed?: true, land: true) }
  let(:airport) {Airport.new}

  context 'when first created' do
    it 'has no planes' do
      expect(subject.planes_at_airport).to be_empty
    end
  end

  context 'when good weather' do
    it 'is no longer in the airport after takeoff' do
      airport.planes_at_airport << plane
      airport.take_off(plane)
      expect(airport.planes_at_airport).not_to include plane
    end

    it 'is in the airport after landing' do
      airport.instruct_land(plane)
      expect(airport.planes_at_airport).to include plane
    end
  end


  context 'when weather stormy' do
    it 'prevents take offs' do

    end
  end


end