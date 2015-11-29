require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, status: nil, land: nil) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:planes) }

  it 'is expected to initialize with @planes set to an empty array' do
    expect(airport.planes).to eq []
  end

  describe '#land' do

    it 'is expected to add the plane passed as argument to the @planes array' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'is expected to not accept a plane that is already landed' do
      allow(plane).to receive(:status).and_return :landed
      expect{airport.land(plane)}.to raise_error "This plane is already landed"
    end

    it 'is expected to instruct the plane to make a landing' do
      expect(plane).to receive(:land)
      airport.land(plane)
    end

  end

end
