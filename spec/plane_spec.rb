require 'plane'

describe Plane do
  before do
    allow(airport).to receive(:weather) { double('Weather') }
    allow(airport.weather).to receive(:stormy?).and_return(false)
  end

  subject(:plane) { described_class.new }
  let(:airport) { double("Airport") }

  describe '#landed?' do
    before do
      plane.send(:land)
    end

    it 'confirms that the plane has landed' do
      expect(plane.landed?).to eq true
    end

    it 'confirms plane is not grounded after takeoff' do
      plane.send(:takeoff)
      expect(plane.landed?).to eq false
    end

    it 'confirms plane is landed after second landing' do
      plane.send(:takeoff)
      plane.send(:land)
      expect(plane.landed?).to eq true
    end
  end

  describe '#takeoff' do
    before do
      plane.send(:land)
      plane.send(:takeoff)
    end

    it 'sets "landed?" status to false' do
      expect(plane).not_to be_landed
    end

    it 'raises error when taking off twice' do
      expect { plane.send(:takeoff) }.to raise_error 'Already flying'
    end
  end

  describe '#land' do
    before do
      plane.send(:land)
    end

    it 'sets "landed?" status to true' do
      expect(plane).to be_landed
    end

    it 'raises error when attempting to land twice successively' do
      expect { plane.send(:land) }.to raise_error 'Already landed'
    end
  end
end
