require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, land: nil) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it { is_expected.to respond_to(:planes) }

  it 'is expected to initialize with @planes set to an empty array' do
    expect(airport.planes).to eq []
  end

  describe '#land' do

    it 'is expected to add the plane passed as argument to the @planes array' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'is expected to instruct the plane to make a landing' do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

  end

  describe '#take_off' do

    it 'is expected to raise an error if plane isn\'t at airport' do

    end

  end

end
