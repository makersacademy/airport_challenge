require 'airport'
require 'coveralls'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  # we use a double beacuse this is an airport test not a plane test

  context 'taking off and landing' do
    before do
      allow(plane).to receive :land
      allow(plane).to receive :take_off
      # you need to allow doubles to recive arguments

    end

    it 'can land a plane' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'lands the same plane when landing a plane' do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

    it 'can let a plane take off' do
      airport.land(plane)
      airport.take_off plane
      expect(airport.planes).to eq []
    end
  end

  context 'traffic control' do

    before do
      allow(plane).to receive :land
      allow(plane).to receive :take_off
    end

    it 'can have a capacity' do
      expect(airport.capacity).to eq 20
    end

    it 'a plane cannot land if the airport is full' do
      airport.capacity.times { airport.land plane }
      expect { airport.land plane }.to raise_error "Sorry you can't land, the Airport is full"
    end
  end
end
