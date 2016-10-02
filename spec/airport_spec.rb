require 'airport'

describe Airport do
  subject(:airport) { described_class.new}
  let(:plane) {double :plane}

  before do
    allow(plane).to receive(:landed)
  end

  describe 'land' do
    it 'tells a plane to land' do
    airport.land(plane)
    expect(airport.planes).to include plane
    end
  end

  describe 'take-off' do
    it 'instructs a plane to take-off' do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).to eq []
    end
  end




end
