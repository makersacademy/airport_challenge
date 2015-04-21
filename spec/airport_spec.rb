require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  # we use a double beacuse this is an airport test not a plane test

  context 'taking off and landing' do

    it 'can land a plane' do
      allow(plane).to receive :land
      # you need to allow doubles to recive arguments
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'lands the same plane when landing a plane' do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

  end
end
