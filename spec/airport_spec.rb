require 'airport'

RSpec.describe Airport do

  describe '#land' do 
    airplane = Airplane.new
    airport = Airport.new

    it 'raise an error if the weather is stormy' do
      weather = :stormy
      expect { airport.land(airplane, weather) }.to raise_error 'The weather is stormy'
    end

    it 'raise an error if the airport is full' do
      weather = :sunny
      airport.capacity = 2
      airport.hangar = [1, 2, 3]
      expect { airport.land(airplane, weather) }.to raise_error 'The airport is full'
    end

    it 'raise an error if the airplane has already landed' do
      weather = :sunny
      airport.hangar = [airplane]
      expect { airport.land(airplane, weather) }.to raise_error 'The airplane has already landed'
    end

    it 'instruct an airplane to land at the airport' do
      airport = Airport.new
      weather = :sunny
      expect(airport.land(airplane, weather)).to include(airplane)
    end
  end

  describe '#take_off' do
    airplane = Airplane.new
    airport = Airport.new
    
    it 'raise an error if the weather is stormy' do
      weather = :stormy
      expect { subject.take_off(airplane, weather) }.to raise_error 'The weather is stormy'
    end

    it 'raise an error if the airplane has already took off or is not in the hangar' do
      weather = :sunny
      expect { airport.take_off(airplane, weather) }.to raise_error 'The airplane is not in the airport'
    end

    it 'instruct a plane to take off' do 
      weather = :sunny
      airport.hangar = [airplane]
      expect(airport.take_off(airplane, weather)).to eq "The airplane #{airplane} has taken off"
    end
  end

end
