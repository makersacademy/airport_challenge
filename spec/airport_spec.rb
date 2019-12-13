require 'airport'

describe Airport do
  it 'instantiates an airport class' do
    airport = Airport.new
    expect(airport).to be_a_kind_of Airport
  end

  describe '#capacity' do
    it 'has a capacity method' do
      airport = Airport.new
      expect(airport).to respond_to(:capacity)
    end

    it 'sets default capacity to 20' do
      airport = Airport.new
      default_capacity = airport.capacity
      expect(default_capacity).to eq(20)
    end

    it 'has a variable capacity' do
      airport = Airport.new
      variable_capacity = airport.capacity
      variable_capacity = 30
      expect(variable_capacity).to eq(30)
    end
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

    it 'returns an error when airport reaches capacity' do
      airport = Airport.new
      plane = Plane.new
      subject.capacity.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    it 'has a take off method' do
      airport = Airport.new
      expect(airport).to respond_to(:take_off)
    end

    it 'raises error if no planes available to take off' do
      airport = Airport.new
      expect { airport.take_off }.to raise_error 'No planes at airport'
    end

    it 'confirms plane takes off from airport' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      airport.take_off
      expect(airport.runway).to eq([])
    end
  end
end
