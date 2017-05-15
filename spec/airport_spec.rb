require 'airport'

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { Airport.new }
  let(:weather) { double :weather }

  describe '#land(plane)' do
    before do
      allow(airport).to receive(:weather_alert) { false }
      allow(plane).to receive(:stationing) { :stationed }
    end
    it 'stores all landed planes in the airport, if weather is good' do
      expect(airport.land(plane)).to eq plane

      airport = Airport.new(1000)
      allow(airport).to receive(:weather_alert) { false }
      1000.times { airport.land(plane) }
      expect(airport.planes).to eq Array.new(1000, plane)
    end
    it 'raises an error if the airport is full' do
      airport::capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error 'The airport is currently full.'
    end
  end

  describe '#take_off(plane)' do
    before do
      allow(plane).to receive(:taking_off) {:in_the_air }
      allow(plane).to receive(:stationing) { :stationed }
      allow(airport).to receive(:stationed?) { true }
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
