require 'plane'

describe Plane do
  let(:plane) {described_class.new}
  let(:airport) {double(:airport, full?: false, stored_planes: [])}

  describe '#airborne?' do

    it 'by default plane is airborne' do
      expect(plane).to be_airborne
    end

  end

  describe '#land' do
    it 'leads to plane being no longer airborne' do
      plane.land(airport)
      expect(plane).not_to be_airborne
    end

    it 'returns plane' do
      plane.land(airport)
      expect(plane).to eq plane
    end

    it 'stores plane in airport' do
      plane.land(airport)
      expect(airport.stored_planes).to eq [plane]
    end

    it 'is prevented when the airport is full' do
      airport = double(:airport, full?: true, stored_planes: [])
      expect{plane.land(airport)}.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    before(:example) {plane.land(airport)}

    it 'leads to plane being airborne' do
      plane.take_off
      expect(plane).to be_airborne
    end

    it 'leads airport to lose plane' do
      plane.take_off
      expect(airport.stored_planes).to be_empty
    end
  end


end
