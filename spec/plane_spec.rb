require 'plane'

describe Plane do
  before do
    allow(airport).to receive(:weather) { double('Weather') }
    allow(airport.weather).to receive(:stormy?).and_return(false)
  end

  subject(:plane) { described_class.new }
  let(:airport) { double("Airport") }

  describe '#landed?' do

    it 'confirms that the plane has landed' do
      plane.land
      expect(plane.landed?).to eq true
    end

    it 'confirms plane is not grounded after takeoff' do
      plane.land
      plane.takeoff
      expect(plane.landed?).to eq false
    end

    it 'confirms plane is landed after second landing' do
      plane.land
      plane.takeoff
      plane.land
      expect(plane.landed?).to eq true
    end
  end

  describe '#takeoff' do
    it 'sets landed to false' do
      plane.takeoff
      expect(plane.landed?).to eq false
    end
  end

  describe '#land' do
    it 'sets landed to true' do
      plane.land
      expect(plane.landed?).to eq true
    end
  end
end
