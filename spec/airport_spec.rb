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
      airport.capacity = [3]
      expect { airport.land(airplane) }.to raise_error 'The airport is full'
    end

    it 'instruct an airplane to land at the airport' do
      airport = Airport.new
      airport.weather = :sunny
      expect(airport.land(airplane)).to eq(airplane)
    end
  end

  describe '#take_off' do
    airplane = Airplane.new
    airport = Airport.new
    
    it 'raise an error if the weather is stormy' do
      airport.weather = :stormy
      expect { airport.take_off(airplane) }.to raise_error 'The weather is stormy'
    end 

    it 'instruct a plane to take off' do 
      airport.weather = :sunny
      expect(airport.take_off(airplane)).to eq "The airplane #{airplane} has taken off"
    end
  end

end
