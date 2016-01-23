require 'airport'

describe Airport do

  describe '#land' do
    let(:plane) { double(:plane) }

    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has the plane that is instructed to land' do
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end
end
