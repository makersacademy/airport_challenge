require 'plane'

describe Plane do
  let(:plane) {described_class.new}
  let(:airport) {double(:airport, landed_planes: [])}

  describe '#landed?' do

    it 'by default plane is in air' do
      expect(plane).not_to be_landed
    end

  end

  describe '#land' do
    it 'leads to plane being landed' do
      plane.land(airport)
      expect(plane).to be_landed
    end

    it 'returns self' do
      plane.land(airport)
      expect(plane).to eq plane
    end

    it 'stores plane in airport' do
      plane.land(airport)
      expect(airport.landed_planes).to eq [plane]
    end
  end

  describe '#take_off' do
    before(:example) {plane.land(airport)}

    it 'leads to plane not being landed' do
      plane.take_off
      expect(plane).not_to be_landed
    end

    it 'leads airport to lose plane' do
      plane.take_off
      expect(airport.landed_planes).to be_empty
    end

    it 'leads plane to lose airport_id' do
      plane.take_off
      expect(plane.airport_id).to be :airborne
    end
  end

describe '#airport_id' do
  it 'has default value :airborne' do
    expect(plane.airport_id).to eq :airborne
  end
  it 'describes airport plane in' do
    plane.land(airport)
    expect(plane.airport_id).to eq airport.object_id
  end
end


end
