require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  describe '#landed?' do
    it 'should return true after landing' do
      airport.land(plane)
      expect(plane.landed?).to eq true
    end

    it 'should return false after takeoff' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.landed?).to eq false
    end
  end
end
