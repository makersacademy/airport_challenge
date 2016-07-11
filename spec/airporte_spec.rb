require 'airport'

describe Airport do
  it {is_expected.to respond_to :land }

  describe '#land' do
    subject(:airport) { described_class.new }
    let(:plane) { double :plane }
    it "Lands a plane" do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.send(:planes)).to include plane
    end
  end
end
