require 'plane'

class Airport
  
  attr_accessor :planes
  
  def initialize
    @planes = []
  end
  
end

describe Plane do

  subject(:plane) {Plane.new}
  subject(:airport) {Airport.new}

  before do 
    # stub airport class methods
    allow(airport).to receive(:full?) {false}
    allow(airport).to receive(:clear?) {true}
  end

  describe '#land_at' do

    it 'lands at the airport' do
      plane.land_at(airport)
      expect(airport.planes[0]).to eq plane
    end
    it 'raises error if weather is stormy' do
      allow(airport).to receive(:clear?) {false}
      expect {plane.land_at(airport)}.to raise_error 'cannot land in stormy weather'
    end
    it 'raises error if trying to land at a full airport' do
      allow(airport).to receive(:full?) {true}
      expect {plane.land_at(airport)}.to raise_error 'cannot land at full airport'
    end 
    it 'raises error if already landed' do
      plane.land_at(airport)
      expect {plane.land_at(airport)}.to raise_error 'plane has already landed'
    end

  end

  describe '#take_off_from' do

    # ensure a plane has landed before taking off in each test
    before(:each) do
      plane.land_at(airport)
    end

    it 'confirms a plane has left the airport' do
      plane.take_off_from(airport)
      expect(airport.planes[0]).to_not eq plane
    end
    it 'allows a plane to land again once taken off' do
      plane.take_off_from(airport)
      plane.land_at(airport)
      expect(airport.planes[0]).to eq plane
    end
    it 'raises error if weather is stormy' do
      allow(airport).to receive(:clear?) {false}
      expect {plane.take_off_from(airport)}.to raise_error 'cannot take off in stormy weather'
    end
    it 'raises error if already in the air and attempting to take off' do
      plane.take_off_from(airport)
      expect {plane.take_off_from(airport)}.to raise_error 'plane is already in the air'
    end
    it 'raises error if in a different airport' do
      expect {plane.take_off_from(Airport.new)}.to raise_error 'plane is not at this airport'
    end

  end

end