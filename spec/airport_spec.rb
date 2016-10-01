require 'airport'

describe Airport do

subject(:airport) { described_class.new }
let(:plane) { double :plane }

  describe '#land' do

      it 'lands a plane at the airport' do
        allow(airport.weather).to receive(:stormy).and_return(nil)
        expect(airport.land(plane)).to eq [plane]
        end

      it 'raises an error if the weather is too stormy for landing' do
        allow(airport.weather).to receive(:stormy).and_return(true)
        expect{airport.land(plane)}.to raise_error 'Weather too stormy for landing'
        end
      end

  describe '#take_off' do

    it 'instructs a plane to take off from the airport' do
      airport.land(plane)
      expect(airport.take_off(plane)).to be plane
    end

    it 'raises an error if the weather is too stormy for take off' do
      allow(airport.weather).to receive(:stormy).and_return(true)
      expect{airport.take_off(plane)}.to raise_error 'Weather too stormy for take off'
    end
  end

  describe '#planes' do
    it 'confirms a landed plane is at the airport' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'confirms a plane has taken off and is no longer at the airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
  end
end
