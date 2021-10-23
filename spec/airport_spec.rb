require 'airport'
require 'plane'

describe Airport do
  let(:plane) { Plane.new }
  let(:airport) { Airport.new}  

  describe '#land' do
    it { is_expected. to respond_to :land }

    it 'lands a plane' do
      expect(airport.land(plane)).to eq(true)
    end
  end

  describe '#take_off' do
    it { is_expected. to respond_to :take_off }

    it 'takes off a plane' do
      expect(airport.take_off(plane)).to eq(true)
    end
  end
end