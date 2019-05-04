require 'airport'

describe Airport do

  it 'will respond to land' do
    expect(Airport.new).to respond_to(:land)
  end

  # it 'create airport with a capacity' do
  #   airport = Airport.new
  #   expect(airport.capacity).to eq(100)
  # end

  describe '#land' do
    it 'will give planes permission to land' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq("Cleared to land")
    end
  end

  it 'will respond to take off' do
    expect(Airport.new).to respond_to(:take_off)
  end

  it 'will instruct a plane to take off' do
    airport = Airport.new
    expect(airport.take_off).to eq("Cleared for take off")
  end
end
