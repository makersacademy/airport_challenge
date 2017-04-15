require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport) }

  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  describe '#landed?' do
    before do
      allow(airport).to receive(:land).and_return(plane)
    end
    
    it 'should return true after landing' do
      allow(plane).to receive(:landed?).and_return(true)
      airport.land(plane)
      expect(plane.landed?).to eq true
    end

    it 'should return false after takeoff' do
      allow(airport).to receive(:takeoff).and_return(plane)
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.landed?).to eq false
    end
  end
end
