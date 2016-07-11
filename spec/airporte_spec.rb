require 'airport'

describe Airport do
  it {is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    subject(:airport) { described_class.new }
    let(:plane) { double :plane }

    it "Lands a plane and has it in after landing" do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.send(:planes)).to include plane
    end

    it "Raises an error when instructed to land a plane that has already landed"  do
      message = 'Unable to land a plane that has already landed before'
      airport.land(plane)
      expect {airport.land(plane)}.to raise_error message
    end

  end
end
