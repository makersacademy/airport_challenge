require "airport"
require "plane"

describe Airport do

  it 'has a default capacity' do
    airport = Airport.new
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  # it { is_expected.to respond_to :take_off }
  
  describe '#take_off' do 
    it 'instructs a plane to take off' do
      airport = Airport.new
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end

    it 'does not allow a plane to take off if weather is stormy' do
      plane = Plane.new
      plane.check_weather
      airport = Airport.new
      airport.land plane
      expect { airport.take_off}.to raise_error 'Cannot take off, weather is stormy'
    end

    it 'raises an error when no planes are available' do
      airport = Airport.new
      expect { airport.take_off }.to raise_error 'No planes available to take-off'
    end
    
    
  end

  describe '#land' do
    
    it 'raises an error when the airport is full' do
      airport = Airport.new
      airport.capacity.times { airport.land(Plane) }
      expect { airport.land(Plane) }.to raise_error 'The airport is full'
    end

    # it 'lands a plane upon instruction' do
    #   airport = Airport.new
    #   plane = Plane.new
    #   expect(airport.land(plane)).to eq plane
    # end
    
    # it 'confirms the plane has already landed' do
    #   airport = Airport.new
    #   plane = Plane.new
    #   airport.land(plane)
    #   expect(airport.plane).to eq plane
    # end

  # it { is_expected.to respond_to :land }
  
  # it { is_expected.to respond_to :plane }
  end
end
