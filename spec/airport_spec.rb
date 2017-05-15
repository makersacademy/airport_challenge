require 'airport'

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { Airport.new }
  let(:weather) { double :weather }

  describe '#land(plane)' do
    it 'stores all landed planes in the airport, if weather is good' do
      allow(airport).to receive(:weather_alert) { false }
      expect(airport.land(plane)).to eq plane

      9.times { airport.land(plane) }
      expect(airport.planes).to eq Array.new(10, plane)

      airport_new = Airport.new(1000)
      allow(airport_new).to receive(:weather_alert) { false }
      1000.times { airport_new.land(plane) }
      expect(airport_new.planes).to eq Array.new(1000, plane)
    end
    it 'raises an error if the airport is full' do
      allow(airport).to receive(:weather_alert) { false }
      airport::capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'The airport is currently full.'
    end
  end

  describe '#take_off(plane)' do
    before do
      allow(plane).to receive(:taking_off).and_return(:in_the_air)
    end
    it 'removes specific plane from the array' do
      allow(airport).to receive(:weather_alert) { false }
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane

      5.times { airport.land(plane) }
      expect(airport.take_off(plane)).to eq plane
    end
    it 'raises an error if the airport is empty' do
      allow(airport).to receive(:weather_alert) { false }
      expect { airport.take_off(plane) }.to raise_error 'There currently are no planes available.'
    end
  end
end
