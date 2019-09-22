require 'airport'

describe Airport do

  subject(:airport) { described_class.new}

  describe '#land_plane' do
    it 'When a plane lands it will enter the airport hanger' do
      plane = double(:plane)
      allow(airport).to receive(:stormy?).and_return(false)
      airport.land_plane(plane)
      expect(airport.hanger).to include plane
    end

    it 'A plane will not land if the weather is stormy' do
      plane = double(:plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect { airport.land_plane(plane) }.to raise_error('Cannot land in stormy weather')
    end
  end

  describe '#takeoff_plane' do
      it 'When a plane takes off it will be removed from the airport hanger' do
        plane = double(:plane)
        allow(airport).to receive(:stormy?).and_return(false)
        airport.hanger << plane
        airport.takeoff_plane(plane)
        expect(airport.hanger).to_not include plane
      end

      it 'A plane will not take off if the weather is stormy' do
        plane = double(:plane)
        airport.hanger << plane
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.takeoff_plane(plane) }.to raise_error('Cannot take off in stormy weather')
      end
    end

end
