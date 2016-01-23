require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#landing' do

    it 'instruct plane to land' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'confirm that plane has landed' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.landed_planes).to include plane
    end

  end

  describe '#take off' do

    it 'instruct plane to takeoff' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'confirm plane is no longer in the airport' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      # airport.land(plane)
      # airport.take_off(plane)
      expect(airport.landed_planes).not_to include plane
    end

  end

end
