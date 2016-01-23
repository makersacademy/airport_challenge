require 'airport'

describe Airport do
  subject(:airport) { described_class.new }


  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'has a default capacity' do
    expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'lands plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end

    it 'returns landed planes' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'raises an error when airport is full' do
      described_class::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
      expect { airport.land(Plane.new) }.to raise_error 'Airport is full!'
    end

    it 'raises an error when plane has already arrived' do
      plane = Plane.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error 'Plane has already arrived.'
    end

    # it 'cannot land plane when stormy' do
    #   plane = Plane.new
    #   allow(airport.weather).to receive(:stormy?).and_return true
    #   expect { airport.land(plane) }.to raise_error 'Plane cannot land in stormy weather.'
    # end
  end

  describe '#takeoff' do
    it 'takeoffs plane' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq plane
    end

    it 'removes plane from airport' do
      plane = Plane.new
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.planes).not_to include plane
    end

    it 'raises an error when plane is not at airport' do
      plane = Plane.new
      expect { airport.takeoff(plane) }.to raise_error 'Plane is not at this airport.'
    end

  end
end