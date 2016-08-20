require 'airport'

describe Airport do

subject(:airport) { described_class.new }
let(:plane) { double :plane }

  describe '#land' do

    it 'lands a plane at the airport' do
      expect(airport.land(plane)).to eq airport
    end

  end

  describe '#take_off' do

    it 'makes a plane take off from the airport' do
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end

    it 'raises error if takeoff attempted in stormy weather' do
      allow(airport.weather).to receive(:stormy).and_return(true)
      expect{airport.take_off(plane)}.to raise_error "Planes cannot take off in stormy weather"
    end

  end

  describe '#planes' do

    it 'has registered landed plane at airport' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'confirms that plane is no longer at airport after takeoff' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

  end


end
