require 'airport'

RSpec.describe Airport do

  describe '#land' do 
    airplane = Airplane.new
    airport = Airport.new

    it 'raise an error if the weather is stormy' do
      airport.weather = :stormy
      expect { airport.land(airplane) }.to raise_error 'The weather is stormy'
    end

    it 'raise an error if the airport is full' do
      airport.weather = :sunny
      airport.capacity = 2
      airport.hangar = [1, 2, 3]
      expect { airport.land(airplane) }.to raise_error 'The airport is full'
    end

    it 'raise an error if the airplane has already landed' do
      airport.weather = :sunny
      airport.hangar = [airplane]
      expect { airport.land(airplane) }.to raise_error 'The airplane has already landed'
    end

    it 'instruct an airplane to land at the airport' do
      airport = Airport.new
      airport.weather = :sunny
      expect(airport.land(airplane)).to include(airplane)
    end
  end

  describe '#take_off' do
    airplane = Airplane.new
    airport = Airport.new
    
    it 'raise an error if the weather is stormy' do
      airport.weather = :stormy
      expect { airport.take_off(airplane) }.to raise_error 'The weather is stormy'
    end

    it 'raise an error if there are no airplanes in the airport' do
      airport.weather = :sunny
      expect { airport.take_off(airplane) }.to raise_error 'There are no airplanes in the airport'
    end

    it 'instruct a plane to take off' do 
      airport.weather = :sunny
      airport.hangar = [airplane]
      expect(airport.take_off(airplane)).to eq "The airplane #{airplane} has taken off"
    end
  end

end
