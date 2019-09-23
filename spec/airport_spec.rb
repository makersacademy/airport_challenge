require 'airport'

describe Airport do
  describe '#take_off' do
    it 'responds to #take_off' do
      airport = Airport.new("0001", "sunny", 10)
      expect(airport).to respond_to :take_off
    end

    it 'plane takes off from airport' do
      plane = Plane.new
      airport = Airport.new("0001", "sunny", "full")
      airport.take_off(plane)
      expect(airport.take_off(plane)).to be_a Plane
    end
    #
    it 'it raises an error if weather is stormy' do
      # allow(subject).to receive(:rand).and_return(1)
      airport = Airport.new("0001", "stormy", 10)
      expect {airport}.to raise_error("Weather is too stormy")
    end
  #
  end

  it 'responds to #land' do
    airport = Airport.new("0001", "sunny", 10)
    expect(airport).to respond_to :land
  end

  it 'lands a plane' do
    plane = Plane.new
    airport = Airport.new("0001", "sunny", 5)
    airport.land(plane)
    expect(airport.land(plane)).to be_a Plane
  end

  it 'is full' do
    array = [] << 11.times {Plane.new}
    airport = Airport.new(array, "sunny", 11)
    expect(airport.full?).to eq true
  end

  it 'has a specific plane in the airport' do
    airport = Airport.new("0001", "sunny", 10)
    expect(airport.plane_in_airport?).to eq true
  end

end
