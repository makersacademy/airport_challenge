require 'airport'

describe Airport do
  subject(:airport) { described_class.new}
  let(:plane) {double :plane}

  it {is_expected.to respond_to :take_off}

  before do
    allow(plane).to receive(:landed)
  end

  describe 'land' do
    it 'tells a plane to land' do
    airport.land(plane)
    expect(airport.planes).to include plane
    end
  end





end
