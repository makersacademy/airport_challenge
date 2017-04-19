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
    it 'sets "landed?" status to false' do
      plane.land
      plane.takeoff
      expect(plane).not_to be_landed
    end

    it 'raises error when taking off twice' do
      plane.land
      plane.takeoff
      expect { plane.takeoff }.to raise_error 'Already flying'
    end
  end

  describe '#land' do
    it 'sets "landed?" status to true' do
      plane.land
      expect(plane).to be_landed
    end

    it 'raises error when attempting to land twice successively' do
      plane.land
      expect { plane.land }.to raise_error 'Already landed'
    end
  end
end
