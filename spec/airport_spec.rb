require 'airport'

describe Airport do
  subject(:airport) { Airport.new }

  it { is_expected.to respond_to(:plane)}

  describe '#land' do
    it 'responds to .land(plane)' do
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'expects .land to not return plane' do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end
  end

  describe '#release' do
    it 'responds to .release(plane)' do
      expect(airport).to respond_to(:release).with(1).argument
    end

    it 'expects .release to return plane' do
      plane = Plane.new
      expect(airport.release(plane)).to eq plane
    end
  end
end
