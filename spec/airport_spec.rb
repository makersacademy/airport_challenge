require "airport"

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe 'landing planes' do

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane after it has landed' do
      subject.land(plane)
      expect(subject.planes).to eq plane
    end
  end
end
