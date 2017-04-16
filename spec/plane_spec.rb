require 'plane'

describe Plane do
  before do
    allow(airport.weather).to receive(:stormy?).and_return(false)
  end

  subject(:plane) { described_class.new }
  let(:airport) { Airport.new }

  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }

  describe '#landed?' do

    it 'confirms that the plane has landed' do
      airport.land(plane)
      expect(plane.landed?).to eq true
    end

    it 'confirms plane is not grounded after takeoff' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(plane.landed?).to eq false
    end

    it 'confirms plane is landed after second landing' do
      airport.land(plane)
      airport.takeoff(plane)
      airport.land(plane)
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
