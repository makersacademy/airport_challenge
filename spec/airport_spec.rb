require 'airport'

describe Airport do
  it 'instantiates an airport class' do
    airport = Airport.new
    expect(airport).to be_a_kind_of Airport
  end

  describe '#land' do
    it 'has a land plane method' do
      airport = Airport.new
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'returns a landed plane' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq([plane])
    end
  end

  describe '#take_off' do
    it 'has a take off method' do
      airport = Airport.new
      expect(airport).to respond_to(:take_off)
    end
  end
end

describe Plane do
  it 'instantiates a plane class' do
    plane = Plane.new
    expect(plane).to be_a_kind_of Plane
  end
end
