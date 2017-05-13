require 'airport'

describe Airport do
  let(:plane) { double :plane }
  subject(:airport) { Airport.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:plane_take_off) }

  describe '#land(plane)' do
    it 'stores all landed planes in the airport' do
      expect(airport.land(plane)).to eq plane
    end
  end

  describe 'plane_take_off' do
    it
  end
end
