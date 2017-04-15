require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :land }

  describe '#landed?' do
    it 'should return true after landing' do
      airport.land(plane)
      expect(plane.landed?).to eq true
    end
  end
end
