require 'airport'

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { Airport.new }

  describe '#land(plane)' do

    it 'stores all landed planes in the airport, if weather is good' do
      airport.instance_variable_set(:@weather_grade, 6)
      expect(airport.land(plane)).to eq plane

      9.times { airport.land(plane) }
      expect(airport.planes).to eq Array.new(10, plane)

      airport_new = Airport.new(1000)
      airport_new.instance_variable_set(:@weather_grade, 6)
      1000.times { airport_new.land(plane) }
      expect(airport_new.planes).to eq Array.new(1000, plane)
    end
    it 'raises an error if stormy' do
      airport.instance_variable_set(:@weather_grade, 3)
      expect { airport.land(plane) }.to raise_error 'Sorry, the storm is too great!'
    end
    it 'raises an error if the airport is full' do
      airport.instance_variable_set(:@weather_grade, 6)
      airport::capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'The airport is currently full.'
    end
  end

  describe '#take_off(plane)' do
    before do
      allow(plane).to receive(:taking_off).and_return(:in_the_air)
    end
    it 'removes specific plane from the array' do
      airport.instance_variable_set(:@weather_grade, 6)
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane

      5.times { airport.land(plane) }
      expect(airport.take_off(plane)).to eq plane
    end
    it 'raises an error if stormy' do
      airport.instance_variable_set(:@weather_grade, 6)
      airport.land(plane)
      airport.instance_variable_set(:@weather_grade, 3)
      expect { airport.take_off(plane) }.to raise_error 'Sorry, the storm is too great!'
    end
    it 'raises an error if the airport is empty' do
      airport.instance_variable_set(:@weather_grade, 6)
      expect { airport.take_off(plane) }.to raise_error 'There currently are no planes available.'
    end
  end
end
